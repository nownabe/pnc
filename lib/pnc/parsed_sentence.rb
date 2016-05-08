# frozen_string_literal: true

require "forwardable"
require "pnc/morpheme"

module Pnc
  class ParsedSentence
    extend Forwardable
    include Enumerable

    attr_reader :morphemes

    def initialize(parsed_enum)
      @morphemes ||=
        parsed_enum.reject do |m|
          m.is_bos? || m.is_eos? || m.is_eon?
        end.map do |m|
          Morpheme.new(m)
        end
    end

    def_delegators :@morphemes, :[], :each

    def to_s
      @string ||= map(&:to_s).join
    end
  end
end
