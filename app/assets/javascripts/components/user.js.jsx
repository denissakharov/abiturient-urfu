class User extends React.Component {
  render () {
    return (
      <h3 className='fio'>
        <a href={this.props.user.number}>{this.props.user.name}</a>
      </h3>
    )
  }
}
