pad = (num) -> if num < 10 then "0#{num}" else "#{num}"
###
    Combination: 3 birthdays
    result key: 215-13-2
###
PageFiveComponent = Ember.Component.extend
    classNames: ['page-five']

    key: '215-13-2'
    selectedDays: null

    setDefaults: Ember.on 'init', ->
        @set 'selectedDays', []

    months: Ember.computed ->
        _.map [31, 27, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], (length, month) ->
            for day in [1..length]
                month: month+1
                day: day
                id: "#{pad(month+1)}-#{pad(day)}"

    actions:
        selectDay: (day) ->
            @$("##{day.id}").addClass 'active'
            @get('selectedDays').pushObject day

            if 3 is @get 'selectedDays.length'
                if @checkCombination()
                    @success()
                else
                    @$('.month .day').removeClass 'active'
                    @set 'selectedDays', []
                    @showIcon 'remove'

    checkCombination: ->
        [first, second, third] = _.sortBy @get('selectedDays'), "id"

        first.month is 2 and first.day is 17 and
        second.month is 11 and second.day is 6 and
        third.month is 12 and third.day is 7

    showIcon: (iconClass) ->
        @$(".indicator .glyphicon-#{iconClass}").removeClass 'hidden'
        window.setTimeout =>
            @$(".indicator .glyphicon-#{iconClass}").addClass 'hidden'
        , 1500

    success: ->
        @showIcon 'ok'
        @set 'showKey', true
        @$('.puzzle-container').fadeOut()
        window.setTimeout =>
            @$().fadeOut()
            window.setTimeout =>
                @sendAction()
            , 1000
        , 2000

`export default PageFiveComponent`
