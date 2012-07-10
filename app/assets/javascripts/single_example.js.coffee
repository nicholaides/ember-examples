$ ->
  userWidget = App.UserWidgetView.create()
  userWidget.appendTo $('body')

  user = App.User.loadOne '/users/dave.json'
  userWidget.set 'content', user
