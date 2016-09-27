class Statements extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props
  }
  render () {
    return(
      <div className='container'>
        <table className='table table-striped'>
          <tbody>
            <tr>
              <th>#</th>
              <th>Фамилия Имя Отчество</th>
              <th>Рег #</th>
              <th>Состояние</th>
              <th>Док. об образовании</th>
              <th>Направление (специальность)</th>
              <th>Образовательная/магистерская программа (институт/филиал)</th>
              <th>Форма обучения</th>
              <th>Бюджетная (контрактная) основа</th>
              <th>Сумма конкурсных баллов</th>
            </tr>
            { this.state.statements.map(
              (statement, index) => {
                return(
                  <Statement
                    key={statement.id}
                    statement={statement}
                    lala={index + 1}
                  />
                )
              }
            )}
          </tbody>
        </table>
      </div>
    )
  }
}
