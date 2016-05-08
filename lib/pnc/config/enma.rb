# frozen_string_literal: true

module Pnc
  module Config
    class Enma < EasySettings
      self.default_files = %w(config/enma.yml)
      self.namespace = Rails.env
    end
  end
end
