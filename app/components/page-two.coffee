PageTwoComponent = Ember.Component.extend
    classNames: ['page-two']

    removeFade: Ember.on 'didInsertElement', ->
        window.setTimeout =>
            @$('.hint').addClass 'fadein'
        , 500

`export default PageTwoComponent`
