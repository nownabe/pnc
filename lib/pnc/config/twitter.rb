# frozen_string_literal: true

module Pnc
  module Config
    class Twitter < EasySettings
      self.default_files = %w(config/twitter.yml)
      self.namespace = Rails.env
    end
  end
end
