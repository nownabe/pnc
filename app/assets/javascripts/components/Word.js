import React from "react"

const Word = ({ score, morpheme }) => {
  let wordClass = "tag"
  if (score > 0)
    wordClass = wordClass + " is-success"
  else if (score < 0)
    wordClass = wordClass + " is-danger"
  else if (score === 0)
    wordClass = wordClass + " is-warning"
  else
    wordClass = wordClass + " is-dark"

  let text = morpheme
  if (score)
    text = text + ":" + score

  return (
    <span className={wordClass}>
      {text}
    </span>
  )
}

export default Word
