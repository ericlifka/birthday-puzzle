`import Ember from 'ember'`

RejectionsMixin = Ember.Mixin.create
    rejections: Ember.computed ->
        [
            "No"
            "Nope"
            "That's not it"
            "What's wrong with you?"
            "Are you even trying?"
            "Wrong"
            "Wronger"
            "Wrongest"
            "Not right"
            "Definitely not"
            "Are you crazy?"
            "Peter could do a better job than this"
            "I can't believe you'd try that"
        ]

`export default RejectionsMixin`
