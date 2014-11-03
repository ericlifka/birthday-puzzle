PageTwoComponent = Ember.Component.extend
    classNames: ['page-two']

    activeMonth: null
    activeDay: null
    activeYear: null

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
            @hideIcons()
            @set 'activeMonth', month
            @$(".month button").removeClass 'active'
            @$(".month button##{month}").addClass 'active'
            @checkCombination()

        selectDay: (day) ->
            @set 'activeDay', day
            @$(".day button").removeClass 'active'
            @$(".day button##{day}").addClass 'active'
            @checkCombination()

        selectYear: (year) ->
            @set 'activeYear', year
            @$(".year button").removeClass 'active'
            @$(".year button##{year}").addClass 'active'
            @checkCombination()

    checkCombination: ->
        month = @get 'activeMonth'
        day = @get 'activeDay'
        year = @get 'activeYear'

        if month is 11 and day is 6 and year is 87
            @markRight()

        else if month isnt null and day isnt null and year isnt null
            @markWrong()

    markRight: ->
        @$('.glyphicon-ok').removeClass 'hidden'

    markWrong: ->
        icon = @$('.glyphicon-remove')
        icon.removeClass 'hidden'
        window.setTimeout ->
            icon.addClass 'hidden'
        , 500

    hideIcons: ->
        @$('.glyphicon-ok').addClass 'hidden'
        @$('.glyphicon-remove').addClass 'hidden'



`export default PageTwoComponent`
