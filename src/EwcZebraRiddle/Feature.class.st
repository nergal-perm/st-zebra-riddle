Class {
	#name : #Feature,
	#superclass : #Object,
	#instVars : [
		'type',
		'value'
	],
	#category : #EwcZebraRiddle
}

{ #category : #accessing }
Feature class >> cigarettes [
	^ Feature new
		type: #cigarettes;
		yourself.
]

{ #category : #accessing }
Feature class >> houseColor [
	^ Feature new
		type: #houseColor;
		yourself.
]

{ #category : #accessing }
Feature class >> houseOrder [
	^ Feature new
		type: #houseOrder;
		yourself.
]

{ #category : #accessing }
Feature >> type [
	^ type
]

{ #category : #accessing }
Feature >> type: aString [ 
	type := aString
]

{ #category : #accessing }
Feature >> value [
	^ value
]

{ #category : #accessing }
Feature >> withValue: aValue [
	value := aValue
]
