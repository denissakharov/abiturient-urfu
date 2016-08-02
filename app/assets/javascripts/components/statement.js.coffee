@Statement = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.lala
      React.DOM.td null,
        React.DOM.a
          href: @props.user.number
          @props.user.name
      React.DOM.td null, @props.user.number
      React.DOM.td null, @props.statement.status
      React.DOM.td null, @props.statement.edu_doc
      React.DOM.td null, @props.statement.specialty
      React.DOM.td null, @props.statement.educational_program
      React.DOM.td null, @props.statement.study_mode
      React.DOM.td null, @props.statement.basis
      React.DOM.td null, @props.statement.points
