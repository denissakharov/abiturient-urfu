class UserStatementList extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props
  }
  render () {
    return(
      <div className='container'>
        <h3 className='fio'>
          {this.state.statements[0].name} <span className='small'>{this.state.statements[0].number}</span>
        </h3>
        { this.state.statements.map(
          (statement) => {
            return(
              <UserStatement key={statement.id} statement={statement} />
            )
          }
        )}
      </div>
    )
  }
}
