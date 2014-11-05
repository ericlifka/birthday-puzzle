pad = (num) -> if num < 10 then "0#{num}" else "#{num}"
###
    Combination: 4 birth years
    result key: 000-00-08
###
PageEightComponent = Ember.Component.extend
    classNames: ['page-eight']

    key: '000-00-08'
    selectedYears: null
    
    setDefaults: Ember.on 'init', ->
        @set 'selectedYears', []

    years: Ember.computed -> [0..99]

    actions:
        selectYear: (year) ->
            @$("##{year}").addClass 'active'
            @get('selectedYears').pushObject year

            if 4 is @get 'selectedYears.length'
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

`export default PageEightComponent`
