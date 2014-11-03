PageThreeComponent = Ember.Component.extend
    classNames: ['page-three']

    focusInput: Ember.on 'didInsertElement', -> @$('input').focus()
    inputError: Ember.computed -> ''

    actions:
        processInput: ->
            console.log 'enter'

`export default PageThreeComponent`
