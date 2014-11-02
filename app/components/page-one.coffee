PageOneComponent = Ember.Component.extend
    classNames: ['page-one']

    currentDisplay: Ember.computed -> ''
    messages: Ember.computed ->
        [
            'Hello'
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
        ]

    showMessages: Ember.on 'init', ->
        current = -1
        interval = window.setInterval =>
            current += 1
            if current < @get "messages.length"
                @set 'currentDisplay', @get "messages.#{current}"
            else
                window.clearInterval interval
        , 3000

`export default PageOneComponent`
