Class {
	#name : #BaselineOfEwcZebraRiddle,
	#superclass : #BaselineOf,
	#category : #BaselineOfEwcZebraRiddle
}

{ #category : #accessing }
BaselineOfEwcZebraRiddle >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'EwcZebraRiddle' ]
]
