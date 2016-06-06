import React from "react"
import { connect } from "react-redux"
import rd3 from "react-d3"

const PieChart = rd3.PieChart

/*
class Graph extends React.Component {
  componentDidMount() {
    // Render Graph

  }

  componentDidUpdate(prevProps, prevState) {
    let { positive, negative, neutral } = this.props
  }

  getData() {
    return [
      {legend: "P", value: this.props.positive, color: "#f4faf0"},
      {legend: "N", value: this.props.negative, color: "#fdeeed"},
      {legend: "-", value: this.props.neutral, color: "#f5f7fa"}
    ]
  }

  render() {
    return (
      <div className="column">
        <svg id="graph" />
      </div>
    )
  }
}
*/

const mapStateToProps = (state, ownProps) => {
  let positive = 0
  let negative = 0
  let neutral = 0
  state.tweets.forEach(tweet => {
    switch (tweet.polarity) {
      case "positive": positive++; break
      case "negative": negative++; break
      case "neutral": neutral++; break
    }
  })

  let data = [
    {label: "Positive", value: positive},
    {label: "Negative", value: negative},
    {label: "Neutral", value: neutral}
  ]

  let colors = (idx) => {
    switch(idx) {
      case 0: return "#97cd76"
      case 1: return "#ed6c63"
      case 2: return "#d3d6db"
    }
  }

  console.log(data)
  return {
    width: 400,
    height: 400,
    radius: 100,
    innerRadius: 0,
    sectorBorderColor: "white",
    colors,
    data,
  }
}

const mapDispatchToProps = (dispatch, ownProps) => ({})

const Graph = connect(mapStateToProps, mapDispatchToProps)(PieChart)

export default Graph
