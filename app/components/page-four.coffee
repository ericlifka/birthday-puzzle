`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

###
    Scavenger hunt item #2
    location: under the kitchen table
    result key: 000-00-04 / placeholder until i sort out the final puzzle
###

PageFourComponent = Ember.Component.extend
    classNames: ['page-four']

    key: Ember.computed -> '000-00-04'

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

`export default PageFourComponent`
