# frozen_string_literal: true

module Pnc
  class Morpheme
    attr_reader :mecab_node

    def initialize(mecab_node)
      @mecab_node = mecab_node
    end

    def surface
      mecab_node.surface
    end

    def 品詞
      features[0]
    end

    def 品詞細分類1
      features[1]
    end

    def 品詞細分類2
      features[2]
    end

    def 品詞細分類3
      features[3]
    end

    def 活用形
      features[4]
    end

    def 活用型
      features[5]
    end

    def original
      features[6]
    end

    def 読み
      features[7]
    end

    def 発音
      features[8]
    end

    def to_s
      surface
    end

    private

    def features
      @features ||= mecab_node.feature.split(",")
    end
  end
end
