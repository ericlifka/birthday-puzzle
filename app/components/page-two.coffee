PageTwoComponent = Ember.Component.extend
    classNames: ['page-two']

    removeFade: Ember.on 'didInsertElement', ->
        window.setTimeout =>
            @$('.hint').addClass 'fadein'
        , 500

    months: Ember.computed -> [1..12]
    days: Ember.computed -> [1..31]
    years: Ember.computed ->
        for i in [0..90] by 10
            [i..(i+9)]

    actions:
        selectMonth: (month) ->
            @set 'activeMonth', month
            @$(".month button").removeClass 'active'
            @$(".month button##{month}").addClass 'active'

        selectDay: (day) ->
            @set 'activeDay', day
            @$(".day button").removeClass 'active'
            @$(".day button##{day}").addClass 'active'

        selectYear: (year) ->
            @set 'activeYear', year
            @$(".year button").removeClass 'active'
            @$(".year button##{year}").addClass 'active'

`export default PageTwoComponent`
