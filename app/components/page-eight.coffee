pad = (num) -> if num < 10 then "0#{num}" else "#{num}"
###
    Combination: 4 birth years
    result key: 330-7-10
###
PageEightComponent = Ember.Component.extend
    classNames: ['page-eight']

    key: '330-7-10'
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
                    @$('.puzzle-container .year').removeClass 'active'
                    @set 'selectedYears', []
                    @showIcon 'remove'

    checkCombination: ->
        [first, second, third, fourth] = _.sortBy @get('selectedYears')
        first is 12 and second is 15 and third is 87 and fourth is 88

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
