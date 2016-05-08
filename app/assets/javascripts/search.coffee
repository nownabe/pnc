# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Graph
  constructor: (@data) ->
    @svg = d3.select("#graph")
    @pie = d3.layout.pie().sort(null).value( (d) -> d.value )
    @arc = d3.svg.arc().innerRadius(0)
    @size = { width: 100, height: 100 }
    @isAnimated = false
    console.log(@arc)

  render: ->
    g = @svg.selectAll(".arc")
      .data(@pie(@data))
      .enter()
      .append("g")
      .attr("class", "arc")

    g.append("path")
      .attr("stroke", "white")
      .attr("fill", (d) -> d.data.color )

    g.append("text")
      .attr("dy", ".35em")
      .style("text-anchor", "middle")
      .style("fill", "white")
      .text( (d) -> "#{d.data.label}(#{d.data.value})" )

  update: ->
    @size.width = parseInt(@svg.style("width"))
    @arc.outerRadius(@size.width / 2)
    @svg.attr("width", @size.width).attr("height", @size.width)

    g = @svg.selectAll(".arc")
      .attr("transform", "translate(#{@size.width / 2},#{@size.width / 2})")

    if @isAnimated
      g.selectAll("path").attr("d", @arc)

    console.log(@arc.centroid)
    g.selectAll("text").attr("transform", (d) -> "translate(#{@arc.centroid(d)})")

  animate: ->
    g = @svg.selectAll(".arc")
    length = @data.length
    i = 0

    g.selectAll("path")
      .transition
      .ease("cubic-out")
      .delay(500)
      .duration(1000)
      .attrTween("d", (d) ->
        interpolate = d3.interpolate(
          {startAngle: 0, endAngle: 0},
          {startAngle: d.startAngle, endAngle: d.endAngle}
        )
        (t) -> @arc(interpolate(t))
      )
      .each("end", (transition, callback) ->
        i++
        @isAnimated = (i == length)
      )

  initialize: ->
    @render()
    @update()
    @animate()

#win = d3.select(window)
#win.on("load", ->
#  data = [
#    { label: "+", count: 5, color: "blue" },
#    { label: "-", count: 10, color: "red" },
#    { label: "N", count: 2, color: "gray" }
#  ]
#  graph = new Graph(data)
#  graph.initialize()
#  win.on("resize", graph.update)
#)
