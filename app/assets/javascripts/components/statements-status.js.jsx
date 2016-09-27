class StatementsStatus extends React.Component {
  constructor(props) {
    super(props);
    this.state = {status: 'updated', statements: 0, users: 0, last_update: 0, progress: 100}
    this.lala = this.lala.bind(this);
    setInterval(this.lala, 1000);
  }
  lala() {
    $.getJSON('/api/statements.status', result => {
      this.setState(result);
    });
  }
  render () {
    var statusText;
    if (this.state.status === 'updated') {
      statusText = <div>Абитуриентов: {this.state.users}. Заявок на поступление: {this.state.statements}. Обновлено: {this.state.last_update}</div>
    }
    else if (this.state.status === 'starting') {
      statusText = <div>Сейчас тут все будет обновляться</div>
      $.post('/update', result => {
        console.log(result);
      })
    }
    else {
      statusText = <div>Идет обновление! {Math.round(this.state.progress)}% завершено.</div>
    }
    return(
      <div>
        <div className='progress'>
          <div className='progress-bar' style={{width: this.state.progress + '%'}}>
            {statusText}
          </div>
        </div>
      </div>
    )
  }
}
