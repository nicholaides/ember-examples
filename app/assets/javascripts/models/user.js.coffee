App.User = Em.Object.extend

  fullName: (->
    @get('firstName') + " " + @get('lastName')
  ).property 'firstName', 'lastName'

  loadFrom: (url)->
    @set 'isLoading', true

    $.ajax url,
      success: (userAttributes)=>
        @setProperties userAttributes
      complete: =>
        @set 'isLoading', false
