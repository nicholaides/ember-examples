UserWidgetView = Ember.View.extend
  templateName: 'user_widget'
  classNames: ['user-widget']
  classNameBindings: ['user.isLoading']


User = Ember.Object.extend
  loadFrom: (url)->
    @set 'isLoading', true
    $.getJSON url, (userAttributes)=>
      @setProperties userAttributes
      @set 'isLoading', false

  fullName: (->
    @get('firstName') + " " + @get('lastName')
  ).property 'firstName', 'lastName'


$ ->
  userWidget = UserWidgetView.create()
  userWidget.appendTo $('body')

  user = User.create()
  userWidget.set 'user', user

  user.loadFrom '/users/dave.json'
