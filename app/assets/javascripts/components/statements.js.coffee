@Statements = React.createClass
  getInitialState: ->
    statements: @props.statements
    index: 0
  getDefaultProps: ->
    statements: []
    index: 1
  findUser: (e) ->
    find = (i for i in @props.users when i.id is e)[0]
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.table
        className: 'table table-striped'
        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.th null, '#'
            React.DOM.th null, 'Фамилия Имя Отчество'
            React.DOM.th null, 'Рег #'
            React.DOM.th null, 'Состояние'
            React.DOM.th null, 'Док. об образовании'
            React.DOM.th null, 'Направление (специальность)'
            React.DOM.th null, 'Образовательная/магистерская программа (институт/филиал)'
            React.DOM.th null, 'Форма обучения'
            React.DOM.th null, 'Бюджетная (контрактная) основа'
            React.DOM.th null, 'Сумма конкурсных баллов'
          for statement, index in @state.statements
            React.createElement Statement, key: statement.id, statement: statement, user: @findUser(statement.user_id), lala: index + 1
