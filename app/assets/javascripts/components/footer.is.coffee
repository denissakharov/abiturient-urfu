@Footer = React.createClass
  render: ->
    React.DOM.footer
      className: 'navbar navbar-default navbar-static-bottom'
      React.DOM.div
        className: 'container'
        React.DOM.p
          className: 'navbar-text'
          'Powered by '
          React.DOM.a
            target: '_blank'
            href: 'http://vk.com/id10898538'
            'Denis Sakharov'
