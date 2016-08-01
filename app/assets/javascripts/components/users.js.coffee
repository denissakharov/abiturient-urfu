@Users = React.createClass
  getInitialState: ->
    users: @props.users
  getDefaultProps: ->
    users: []
  handleInput: (e) ->
    self = @
    $.get '/', query: e.target.value, (result) ->
      self.setState users: result
    ,'JSON'
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'
        React.DOM.input
          className: 'form-control'
          id: 'query'
          type: 'text'
          placeholder: 'ФИО или регистрационный номер без ноля вначале'
          style: { textAlign: 'center'}
          onInput: @handleInput
        if jQuery.isEmptyObject(@state.users)
          React.DOM.h1
            className: 'light'
            'Самое время найти себя'
        else
          for user in @state.users
            React.createElement User, key: user.id, user: user
