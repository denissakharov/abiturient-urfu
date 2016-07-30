@Header = React.createClass
  handleInput: ->
    console.log 'lala'
  render: ->
    React.DOM.div
      className: 'nav navbar navbar-default'
      React.DOM.div
        className: 'container'
        React.DOM.div
          className: 'navbar-header'
          React.DOM.a
            className: 'navbar-brand'
            href: 'http://urfu.ru/ru/alpha/full/'
            target: '_blank'
            React.DOM.img
              src: 'http://urfu.ru/typo3conf/ext/urfu/Resources/Public/images/header/logo1.png'
          React.DOM.a
            className: 'navbar-brand'
            href: '/'
            'Списки поступающих'
