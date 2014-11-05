`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

PageNineComponent = Ember.Component.extend RejectionsMixin,
    classNames: ['page-nine']

    inputError: Ember.computed -> '&nbsp;'
    inputValue: Ember.computed -> ''

    moveKeyTracker: Ember.on 'didInsertElement', ->
        $('.key-tracker').css {
            left: "25%"
            top: "250px"
        }

        @$('input.input-box').focus()

    actions:
        processInput: ->
            input = @get 'inputValue'
            if input.toUpperCase() is "I LOVE YOU"
                @success()
            else
                @set 'inputValue', ''
                @set 'inputError', _.sample(@get 'rejections')

    success: ->
        $('.hint .message').fadeOut()
        $('.input-form').fadeOut()
        $('.key-tracker').fadeOut()
        window.setTimeout ->
            $('.hint').append $('<div class="message">Dawww... I love you too!</div>')
            window.setTimeout ->
                $('body').append $('<div class="the-end">HAPPY BIRTHDAY!</div>')
            , 2000
        , 1000

`export default PageNineComponent`
