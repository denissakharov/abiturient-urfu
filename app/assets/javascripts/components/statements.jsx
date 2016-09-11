class Statements extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props
  }
  findUser (e) {
    var find, i;
    return find = ((function() {
      var j, len, ref, results;
      ref = this.props.users;
      results = [];
      for (j = 0, len = ref.length; j < len; j++) {
        i = ref[j];
        if (i.id === e) {
          results.push(i);
        }
      }
      return results;
    }).call(this))[0];
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
                    user={ this.findUser(statement.user_id)}
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
