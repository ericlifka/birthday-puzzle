KeyTrackerComponent = Ember.Component.extend
    classNames: ['key-tracker']

    keyOne: Ember.computed 'page', -> 1 <= @get 'page'
    keyTwo: Ember.computed 'page', -> 2 <= @get 'page'
    keyThree: Ember.computed 'page', -> 3 <= @get 'page'
    keyFour: Ember.computed 'page', -> 4 <= @get 'page'
    keyFive: Ember.computed 'page', -> 5 <= @get 'page'
    keySix: Ember.computed 'page', -> 6 <= @get 'page'
    keySeven: Ember.computed 'page', -> 7 <= @get 'page'
    keyEight: Ember.computed 'page', -> 8 <= @get 'page'

`export default KeyTrackerComponent`
