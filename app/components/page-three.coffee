`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

###
    Scavenger hunt item #1
    location: under the dog bed in her cage
    result key: 1A1CAF28
###

PageThreeComponent = Ember.Component.extend RejectionsMixin,
    classNames: ['page-three']

    key: Ember.computed -> '000-00-03'

    focusInput: Ember.on 'didInsertElement', -> @$('input').focus()
    inputError: Ember.computed -> '&nbsp;'
    inputValue: Ember.computed -> ''

    actions:
        processInput: ->
            input = @get 'inputValue'
            if input.toUpperCase() is @get 'key'
                @set 'inputError', '&nbsp;'
                @success()
            else
                @set 'inputValue', ''
                @set 'inputError', _.sample(@get 'rejections')

    success: ->
        @$('.clue').fadeOut()
        @$('form').fadeOut()
        window.setTimeout =>
#            @$('.container').append $('<div class="correct">Correct!</div>')
            @set 'showKey', true
            window.setTimeout =>
                @sendAction()
            , 1500
        , 500

`export default PageThreeComponent`
