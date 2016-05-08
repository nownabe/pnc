# frozen_string_literal: true

require "pnc/parser"

module Pnc
  class Enma
    class << self
      def dictionary
        @dictionary ||= load_dictionary
      end

      private

      def dictionary_path
        Config::Enma.dictionary_path
      end

      def load_dictionary
        File.read(dictionary_path).lines.each_with_object(base_dictionary) do |line, obj|
          word, 読み, 品詞, score = line.split(":")
          obj["#{word}:#{読み}:#{品詞}"] = score.to_f
        end
      end

      def base_dictionary
        Hash.new { |hash, key| hash[key] = 0.0 }
      end
    end

    attr_reader :sentence
    attr_reader :words

    def initialize(sentence)
      @sentence = sentence
      @words = []
    end

    # :positive / :neutral / :negative
    def polarity
      @polarity ||=
        case
        when score.zero?
          :neutral
        when score.positive?
          :positive
        when score.negative?
          :negative
        end
    end

    def score
      @score ||= convolute
    end

    private

    def get_dictionary_score_of(morpheme)
      score = self.class.dictionary[convert_morpheme_to_key(morpheme)]
      @words << { morpheme: morpheme, score: score }
      score
    rescue
      @words << { morpheme: morpheme }
      0.0
    end

    def convert_morpheme_to_key(morpheme)
      yomi = morpheme.読み.tr("ァ-ン", "ぁ-ん")
      "#{morpheme.original}:#{yomi}:#{morpheme.品詞}"
    end

    def convolute
      parsed_sentence.inject(0.0) do |sum, morpheme|
        sum + get_dictionary_score_of(morpheme)
      end
    end

    def parsed_sentence
      @parsed_sentence ||= Parser.parse(sentence)
    end
  end
end
