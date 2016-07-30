@App = React.createClass
  render: ->
    React.DOM.div null,
      React.createElement Header
      React.createElement Users
      React.createElement Footer
