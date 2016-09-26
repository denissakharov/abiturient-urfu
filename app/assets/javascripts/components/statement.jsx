class Statement extends React.Component {
  render () {
    return(
      <tr>
        <td>{this.props.lala}</td>
        <td>
          <a href={this.props.statement.number}>{this.props.statement.name}</a>
        </td>
        <td>{this.props.statement.number}</td>
        <td>{this.props.statement.status}</td>
        <td>{this.props.statement.edu_doc}</td>
        <td>{this.props.statement.specialty}</td>
        <td>{this.props.statement.educational_program}</td>
        <td>{this.props.statement.study_mode}</td>
        <td>{this.props.statement.basis}</td>
        <td>{this.props.statement.points}</td>
      </tr>
    )
  }
}







// @Statement = React.createClass
//   render: ->
//     React.DOM.tr null,
//       React.DOM.td null, @props.lala
//       React.DOM.td null,
//         React.DOM.a
//           href: @props.user.number
//           @props.user.name
//       React.DOM.td null, @props.user.number
//       React.DOM.td null, @props.statement.status
//       React.DOM.td null, @props.statement.edu_doc
//       React.DOM.td null, @props.statement.specialty
//       React.DOM.td null, @props.statement.educational_program
//       React.DOM.td null, @props.statement.study_mode
//       React.DOM.td null, @props.statement.basis
//       React.DOM.td null, @props.statement.points
