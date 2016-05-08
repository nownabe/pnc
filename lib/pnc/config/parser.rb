# frozen_string_literal: true

module Pnc
  module Config
    class Parser < EasySettings
      self.default_files = %w(config/parser.yml)
      self.namespace = Rails.env
    end
  end
end
