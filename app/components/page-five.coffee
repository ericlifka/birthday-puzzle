PageFiveComponent = Ember.Component.extend
    classNames: ['page-five']

    dates: Ember.computed ->
        _.map [31, 27, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], (length, month) ->
            for day in [1..length]
                month: month+1
                day: day

`export default PageFiveComponent`
