`import RejectionsMixin from 'birthday-puzzle/mixins/rejections'`

###
    Scavenger hunt item #1
    location: under the dog bed in her cage
    result key: 1A1CAF28
###

PageThreeComponent = Ember.Component.extend RejectionsMixin,
    classNames: ['page-three']

    focusInput: Ember.on 'didInsertElement', -> @$('input').focus()
    inputError: Ember.computed -> '&nbsp;'
    inputValue: Ember.computed -> ''

    actions:
        processInput: ->
            input = @get 'inputValue'
            if input.toUpperCase() is '1A1CAF28'
                @set 'inputError', '&nbsp;'
                @success()
            else
                @set 'inputValue', ''
                @set 'inputError', _.sample(@get 'rejections')


`export default PageThreeComponent`
