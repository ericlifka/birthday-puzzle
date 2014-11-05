ApplicationController = Ember.Controller.extend
    currentPage: Ember.computed ->
        JSON.parse localStorage.getItem('currentPage') or '1'

    saveCurrentPage: Ember.observer 'currentPage', ->
        localStorage.setItem 'currentPage', JSON.stringify @get 'currentPage'

    pageOne: Ember.computed 'currentPage', -> 1 is @get 'currentPage'
    pageTwo: Ember.computed 'currentPage', -> 2 is @get 'currentPage'
    pageThree: Ember.computed 'currentPage', -> 3 is @get 'currentPage'
    pageFour: Ember.computed 'currentPage', -> 4 is @get 'currentPage'
    pageFive: Ember.computed 'currentPage', -> 5 is @get 'currentPage'
    pageSix: Ember.computed 'currentPage', -> 6 is @get 'currentPage'
    pageSeven: Ember.computed 'currentPage', -> 7 is @get 'currentPage'
    pageEight: Ember.computed 'currentPage', -> 8 is @get 'currentPage'
    pageNine: Ember.computed 'currentPage', -> 9 is @get 'currentPage'

    actions:
        pageDone: ->
            @incrementProperty 'currentPage'

`export default ApplicationController`
