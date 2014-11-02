PageOneComponent = Ember.Component.extend
    classNames: ['page-one']

    currentDisplay: Ember.computed -> 'Hello'
    messages: Ember.computed ->
        [
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
            'First, what is your name?'
        ]

    showMessages: Ember.on 'didInsertElement', ->
        $pane = @$('.display-text')
        current = -1
        total = @get "messages.length"
        fade = -> $pane.addClass 'fadeout'
        show = ->
            $pane.removeClass 'fadeout'
            if current < total - 1
                window.setTimeout fade, 2000

        updateMessage = =>
            current += 1
            if current < total
                @set 'currentDisplay', @get "messages.#{current}"
                show()

            else
                window.clearInterval interval
                @$('input.input-box').focus()

        show()
        interval = window.setInterval updateMessage, 3000

`export default PageOneComponent`
