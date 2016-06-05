import React from "react"
import Word from "./Word"

const Tweet = ({ polarity, user_uri, user_icon_uri, text, words}) => {
  let tweet_class = "media-content"
  switch (polarity) {
    case "positive":
      tweet_class = tweet_class + " is-success"
    case "negative":
      tweet_class = tweet_class + " is-danger"
  }

  let wordId = 0

  return (
    <article className="media">
      <figure className="media-left">
        <p className="image">
          <a href={user_uri}>
            <img src={user_icon_uri} />
          </a>
        </p>
      </figure>
      <div className="media-content">
        <div className={tweet_class}>
          <div className="message-body">
            {text}
          </div>
        </div>
        <div className="words">
          {words.map(word => <Word key={wordId++} {...word} />)}
        </div>
      </div>
    </article>
  )
}

export default Tweet
