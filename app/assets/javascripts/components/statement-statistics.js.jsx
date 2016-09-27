class StatementStatistics extends React.Component {
  constructor(props) {
    super(props);
    this.state = {min: 0, max: 0, users_quantity: 0, user_raiting: 0}
    $.getJSON('/api/statements.statistics', { study_mode: this.props.study_mode, basis: this.props.basis, educational_program: this.props.educational_program, number: this.props.number }, result => {
      this.setState(result);
    }.bind(this))
  }
  render () {
    return(
      <div className='panel-footer'>
        <p>Минимально набранное колличество баллов на этой специальности - {this.state.min}, максимальное - {this.state.max}</p>
        <p>
          {this.state.users_quantity} человек подали заявки сюда же. Вы на {this.state.user_raiting} месте (<a href={"/statements?study_mode=" + this.props.study_mode + "&basis=" + this.props.basis + "&educational_program=" + this.props.educational_program}>cмотреть всех</a>)
        </p>
      </div>
    )
  }
}
