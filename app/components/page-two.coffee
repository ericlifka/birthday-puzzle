PageTwoComponent = Ember.Component.extend
    classNames: ['page-two']

    removeFade: Ember.on 'didInsertElement', ->
        window.setTimeout =>
            @$('.hint').addClass 'fadein'
        , 500

    months: Ember.computed -> [1..12]
    days: Ember.computed -> [1..31]

    actions:
        selectMonth: (month) ->
            console.log month
            @$(".month button##{month}").addClass 'active'

`export default PageTwoComponent`
