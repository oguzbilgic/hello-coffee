import React from 'react'

export default class Counter extends React.Component
  constructor: (props) ->
   super props
   @state = @getInitialState props

  getInitialState: ({initialCount}) ->
    return
      counter: initialCount || 0
      counterId: null

  setHandlerInterval: (handler) =>
    # Clear current handler if It's already running
    if @state.counterId
      counterId = clearInterval(@state.counterId)

    # Unless the handler is null register it
    if handler
      counterId = setInterval handler, 1000

    @setState {counterId}

  handleStartIncrease: =>
    @setHandlerInterval @handleIncrease

  handleStartDecrease: =>
    @setHandlerInterval @handleDecrease

  handleStop: =>
    @setHandlerInterval null

  handleIncrease: =>
    @setState counter: @state.counter + 1

  handleDecrease: =>
    if @state.counter > 0
      @setState counter: @state.counter - 1
    else
      @setHandlerInterval null

  handleReset: =>
    @setHandlerInterval null
    initialState = @getInitialState @props
    @setState initialState

  color: =>
    if @state.counter is 0
      'red'
    else if @state.counter < 3
      'orange'
    else if @state.counter < 5
      'green'
    else
      'black'

  render: ->
    <div style={color: @color()}>
      <div>
        Counter {@state.counter}
      </div>

      <button onClick={@handleIncrease}>
        increase
      </button>

      <button onClick={@handleDecrease}>
        decrease
      </button>

      <button onClick={@handleReset}>
        reset
      </button>

      <button onClick={@handleStartIncrease}>
        start increase
      </button>

      <button onClick={@handleStartDecrease}>
        start decrease
      </button>

      <button onClick={@handleStop}>
        stop
      </button>

      <pre>
        Props: {JSON.stringify @props, null, 2}
      </pre>

      <pre>
        State: {JSON.stringify @state, null, 2}
      </pre>
    </div>
