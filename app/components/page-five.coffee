PageFiveComponent = Ember.Component.extend
    classNames: ['page-five']

    key: '000-00-05'
    selectedDays: null

    setDefaults: Ember.on 'init', ->
        @set 'selectedDays', []

    months: Ember.computed ->
        _.map [31, 27, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], (length, month) ->
            for day in [1..length]
                month: month+1
                day: day
                id: "#{month+1}-#{day}"

    actions:
        selectDay: (day) ->
            @$("##{day.id}").addClass 'active'
            @get('selectedDays').pushObject day
            

`export default PageFiveComponent`
