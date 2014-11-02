PageOneComponent = Ember.Component.extend
    classNames: ['page-one']

    currentDisplay: Ember.computed -> '&nbsp;'
    messages: Ember.computed ->
        [
            'Hello'
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
            'First, what is your name?'
        ]

    showMessages: Ember.on 'didInsertElement', ->
        $pane = @$('.display-text')
        current = -1
        total = @get "messages.length"
        interval = window.setInterval =>
            current += 1
            if current < total
                @set 'currentDisplay', @get "messages.#{current}"
                $pane.removeClass 'fadeout'
                if current < total - 1
                    window.setTimeout =>
                        $pane.addClass 'fadeout'
                    , 2000
            else
                window.clearInterval interval
                @$('input.input-box').focus()
        , 3000

`export default PageOneComponent`
