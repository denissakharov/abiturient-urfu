@User = React.createClass
  render: ->
    React.DOM.h3
      className: 'fio'
      React.DOM.a
        href: @props.user.number
        @props.user.name
