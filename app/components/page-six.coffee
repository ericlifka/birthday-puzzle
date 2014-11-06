`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

###
    Scavenger hunt item #3
    location: under the bed
    result key: 211-3-4 / placeholder until i sort out the final puzzle
###

PageSixComponent = Ember.Component.extend
    classNames: ['page-six']

    key: Ember.computed -> '211-3-4'

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
            @set 'showKey', true
            window.setTimeout =>
                @sendAction()
            , 1500
        , 500

`export default PageSixComponent`
