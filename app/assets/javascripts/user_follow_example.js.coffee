window.App = Ember.Application.create()

App.UserWidgetView = Ember.View.extend
  templateName:      'user_widget'
  classNames:        ['user-widget']
  classNameBindings: ['user.isLoading']

App.PokeView = Ember.View.extend
  tagName:           'input'
  attributeBindings: ['type', 'value', 'disabled']
  type:              'button'

  disabled: (->
    @getPath 'user.isPoked'
  ).property 'user.isPoked'

  value: (->
    if @getPath 'user.isPoked' then 'Poked' else 'Poke'
  ).property 'user.isPoked'

  click: ->
    @get('user').poke()


App.User = Ember.Object.extend
  loadFrom: (url)->
    @set 'isLoading', true
    $.getJSON url, (userAttributes)=>
      @setProperties userAttributes
      @set 'isLoading', false

  fullName: (->
    @get('firstName') + " " + @get('lastName')
  ).property 'firstName', 'lastName'

  poke: ->
    @set 'isPoked', true
    $.post @get('pokesPath')

$ ->
  userWidget = App.UserWidgetView.create()
  userWidget.appendTo $('body')

  user = App.User.create()
  userWidget.set 'user', user

  user.loadFrom '/users/dave.json'
