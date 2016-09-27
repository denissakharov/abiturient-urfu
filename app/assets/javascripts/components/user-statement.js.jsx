class UserStatement extends React.Component {
  constructor(props) {
    super(props);
  }
  render () {
    return(
      <div className='panel panel-default'>
        <table className='table'>
          <tbody>
            <tr>
              <th>Состояние</th>
              <th>Док. об образовании</th>
              <th>Направление (специальность)</th>
              <th>Образовательная/магистерская программа (институт/филиал)</th>
              <th>Форма обучения</th>
              <th>Бюджетная (контрактная) основа</th>
              <th>Сумма конкурсных баллов</th>
            </tr>
            <tr>
              <td>{this.props.statement.status}</td>
              <td>{this.props.statement.edu_doc}</td>
              <td>{this.props.statement.specialty}</td>
              <td>{this.props.statement.educational_program}</td>
              <td>{this.props.statement.study_mode}</td>
              <td>{this.props.statement.basis}</td>
              <td>{this.props.statement.points}</td>
            </tr>
          </tbody>
        </table>
        <StatementStatistics study_mode={this.props.statement.study_mode} basis={this.props.statement.basis} educational_program={this.props.statement.educational_program} number={this.props.statement.number} />
      </div>
    )
  }
}
