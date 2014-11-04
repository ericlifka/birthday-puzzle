`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

PageOneComponent = Ember.Component.extend RejectionsMixin,
    classNames: ['page-one']

    key: 'placeholder1'

    currentDisplay: Ember.computed -> 'Hello'
    messages: Ember.computed ->
        [
            'This is a game'
            'Solve my riddles and crack my codes'
            'You might get something nice...'
            'First, what is your name?'
        ]

    currentQuestion: Ember.computed -> 'name'
    inputError: Ember.computed -> '&nbsp;'

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
            @set 'inputValue', ''
            switch @get 'currentQuestion'
                when 'name' then @processNameInput value

    processNameInput: (name) ->
        @clearError()
        switch name.toUpperCase()
            when 'PETER', 'CALVIN' then @showError "You aren't a baby"
            when 'POOKUMS', 'POOKUS' then @showError "No, that's your nickname"
            when 'ERIC' then @showError "No... That's me"
            when 'MERLIN', 'WAFFLES' then @showError "That's your cat"
            when 'MOLLY' then @showError "That's your puppy"
            when 'FUZZBOT' then @showError "That's your bunny"
            when 'NICOLE' then @resolvePage()
            else @showError _.sample(@get 'rejections')

    clearError: -> @set 'inputError', '&nbsp;'
    showError: (message) -> @set 'inputError', message

    resolvePage: ->
        @$("form").hide()
        @$('.display-text').addClass 'fadeout'
        window.setTimeout =>
            @set 'currentDisplay', "Good, now solve this puzzle"
            @$('.display-text').removeClass 'fadeout'
            window.setTimeout =>
                @$('.display-text').addClass 'fadeout'
            , 2000
            window.setTimeout =>
                @sendAction()
            , 2500
        , 1000

`export default PageOneComponent`
