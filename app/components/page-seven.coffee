`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

###
    Scavenger hunt item #4
    location: washing machine
    result key: 000-00-07 / placeholder until i sort out the final puzzle
###

PageSevenComponent = Ember.Component.extend
    classNames: ['page-seven']

    key: Ember.computed -> '000-00-07'

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

`export default PageSevenComponent`
