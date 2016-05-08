# frozen_string_literal: true

require "natto"
require "pnc/parsed_sentence"

module Pnc
  class Parser
    class << self
      def parse(sentence)
        ParsedSentence.new(mecab.enum_parse(sentence))
      end

      private

      def dic_path
        Pnc::Config::Parser.dic_path
      end

      def mecab
        @mecab ||= Natto::MeCab.new(dicdir: dic_path)
      end
    end
  end
end
