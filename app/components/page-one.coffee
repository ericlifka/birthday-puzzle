PageOneComponent = Ember.Component.extend
    classNames: ['page-one']

    currentDisplay: Ember.computed -> '&nbsp;'
    messages: Ember.computed ->
        [
            'Hello'
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
        ]

    showMessages: Ember.on 'didInsertElement', ->
        $pane = @$('.display-text')
        current = -1
        interval = window.setInterval =>
            current += 1
            if current < @get "messages.length"
                @set 'currentDisplay', @get "messages.#{current}"
                $pane.removeClass 'fadeout'
                window.setTimeout =>
                    $pane.addClass 'fadeout'
                , 2000
            else
                window.clearInterval interval
        , 3000

`export default PageOneComponent`
