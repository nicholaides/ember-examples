window.App = Ember.Application.create()

App.UserWidgetView = Ember.View.extend
  templateName:      'user_widget'
  classNames:        ['user-widget']
  classNameBindings: ['content.isLoading']

App.PokeView = Ember.View.extend
  tagName:           'input'
  attributeBindings: ['type', 'value', 'disabled']
  type:              'button'

  disabled: (->
    @getPath 'content.isPoked'
  ).property 'content.isPoked'

  value: (->
    if @getPath 'content.isPoked' then 'Poked' else 'Poke'
  ).property 'content.isPoked'

  click: ->
    @get('content').poke()


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

App.User.reopenClass
  loadMore: (callback)->
    $.getJSON '/users/more', (response)=>
      users = response.users.map (userAttributes)=>
        @create userAttributes
      callback(users)
