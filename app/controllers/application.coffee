ApplicationController = Ember.Controller.extend
    currentPage: Ember.computed -> 1

    pageOne: Ember.computed 'currentPage', -> 1 is @get 'currentPage'

    actions:
        pageDone: ->
            @incrementProperty 'currentPage'

`export default ApplicationController`
