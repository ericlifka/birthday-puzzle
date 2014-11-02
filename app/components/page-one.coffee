`import RejectionsMixin from 'BirthdayPuzzle/mixins/rejections'`

PageOneComponent = Ember.Component.extend RejectionsMixin,
    classNames: ['page-one']

    currentDisplay: Ember.computed -> 'Hello'
    messages: Ember.computed ->
        [
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
            'First, what is your name?'
        ]

    currentQuestion: Ember.computed -> 'name'

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

    actions:
        processInput: ->
            value = @get 'inputValue'
            switch @get 'currentQuestion'
                when 'name' then @processNameInput value

    processNameInput: (name) ->
        switch name.toUpperCase()
            when 'PETER' then @showMessage "No, that's your son"
            when 'POOKUMS', 'POOKUS' then @showMessage "No, that's your nickname"
            when 'NICOLE' then @something()
            else
                @showMessage _.sample(@get 'rejections')

    randomRejection: ->


`export default PageOneComponent`
