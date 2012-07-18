App.User = Ember.Object.extend
  fullName: (->
    @get('firstName') + " " + @get('lastName')
  ).property('firstName', 'lastName')

App.UserWidgetView = Ember.View.extend
  templateName: 'simple_user_widget'
  classNames:   ['user-widget']

$ ->
  userWidget = App.UserWidgetView.create()
  userWidget.appendTo $('body')

  user = App.User.create
    avatarPath: "/assets/dave.jpg"
    firstName:   "Dave"
    lastName:    "Coullier"

  userWidget.set 'user', user

  # Make these available in the console
  window.userWidget = userWidget
  window.user = user
