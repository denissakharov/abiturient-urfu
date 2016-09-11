class Users extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props
    this.handleInput = this.handleInput.bind(this);
  }
  handleInput (event) {
    var self = this;
    $.get( '/', { query: event.target.value }, result => {
      self.setState({users: result});
      self.props = {users: result}
    }, 'json');
  }
  render () {
    return (
      <div className='container'>
        <div className='row'>
          <input
            className='form-control'
            id='query'
            type='text'
            placeholder='ФИО или регистрационный номер без ноля вначале'
            style={{textAlign: 'center'}}
            onInput={this.handleInput}>
          </input>
          { jQuery.isEmptyObject(this.state.users) ? <h1 className='light'>Самое время найти себя</h1> : null }
          { this.state.users.map(
            user => {
              return(
                <User key={user.id} user={user} />
              )
            }
          )}
        </div>
      </div>
    )
  }
}
