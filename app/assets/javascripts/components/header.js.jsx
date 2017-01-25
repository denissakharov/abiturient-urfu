class Header extends React.Component {
  render () {
    return(
      <div className='nav navbar navbar-default'>
        <div className='container'>
          <div className='navbar-header'>
            <a className='navbar-brand' href='/'>Списки поступающих</a>
          </div>
          <ul className="nav navbar-nav navbar-right">
            <li><a href='http://urfu.ru/ru/alpha/full/' target='_blank'>Таблица абитуриентов на сайте УрФУ</a></li>
          </ul>
        </div>
      </div>
    )
  }
}
