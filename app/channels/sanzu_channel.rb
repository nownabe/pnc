# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SanzuChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sanzu_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    tweet = {
      polarity: "positive",
      user_uri: "http://example.com",
      user_icon_uri: "https://pbs.twimg.com/profile_images/649591757395496960/BRLEjCwS.jpg",
      text: data["message"],
      words: [
        { score: 20, morpheme: "あ" },
        { score: -10, morpheme: "い" },
        { score: 0, morpheme: "う" },
        { score: 10, morpheme: "え" },
        { score: -20, morpheme: "お" },
      ]
    }
    ActionCable.server.broadcast "sanzu_channel", tweet: tweet
  end

  def analyze(data)
    tweets = Pnc::TwitterSearcher.search(data["query"])
    Parallel.each(tweets, in_threads: 4) do |tweet|
      ActionCable.server.broadcast "sanzu_channel", tweet: tweet.to_hash
    end
  end
end
