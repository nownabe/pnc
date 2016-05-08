# frozen_string_literal: true

module Pnc
  class TwitterSearcher
    class << self
      def search(query, options = {})
        client.search(
          query,
          default_options.merge(options)
        ).map { |t| Tweet.new(t) }
      end

      private

      def client
        @client ||=
          Twitter::REST::Client.new do |c|
            c.consumer_key = Pnc::Config::Twitter.consumer_key
            c.consumer_secret = Pnc::Config::Twitter.consumer_secret
            c.access_token = Pnc::Config::Twitter.access_token
            c.access_token_secret = Pnc::Config::Twitter.access_token_secret
          end
      end

      def default_options
        Pnc::Config::Twitter.default_search_options
      end
    end
  end
end
