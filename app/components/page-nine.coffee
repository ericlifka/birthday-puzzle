PageNineComponent = Ember.Component.extend
    classNames: ['page-nine']

    moveKeyTracker: Ember.on 'didInsertElement', ->
        $('.key-tracker').css {
            left: "25%"
            top: "250px"
        }

`export default PageNineComponent`
