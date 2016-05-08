# frozen_string_literal: true

class Tweet
  extend Forwardable

  def_delegators :enma, :polarity, :words

  attr_reader :raw_tweet

  def initialize(raw_tweet)
    @raw_tweet = raw_tweet
  end

  def negative?
    polarity == :negative
  end

  def neutral?
    polarity == :neutral
  end

  def rinsed_text
    @rinsed_text ||=
      text
      .gsub(/@\w+\s*/, "")
      .gsub(/RT\s*/, "")
      .gsub(/#[^\s#]+\s*/, "")
      .gsub(%r{https?://.+?(\s+)?$}, "")
  end

  def polarity
    @polarity ||= enma.polarity
  end

  def positive?
    polarity == :positive
  end

  def text
    raw_tweet.text
  end

  def to_partial_path
    "search/tweet"
  end

  def user
    raw_tweet.user
  end

  def user_icon_uri
    user.profile_image_uri.to_s
  end

  def user_name
    user.name
  end

  def user_uri
    user.uri.to_s
  end

  private

  def enma
    @enma ||= Pnc::Enma.new(rinsed_text)
  end
end
