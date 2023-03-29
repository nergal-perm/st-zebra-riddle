Class {
	#name : #Feature,
	#superclass : #Object,
	#instVars : [
		'name',
		'values'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Feature class >> withName: aString andValues: aCollection [ 
	^ Feature new
		setName: aString;
		setValues: aCollection;
		yourself.
]

{ #category : #converting }
Feature >> asFeatureValue: aValue [
	^ (self contains: aValue)
		ifTrue: [ FeatureValue new withValue: aValue; type: name; yourself].
]

{ #category : #testing }
Feature >> contains: aValue [
	^ values anySatisfy: [:each | each = aValue].
]

{ #category : #accessing }
Feature >> hasName: aName [
	^ name = aName
]

{ #category : #private }
Feature >> setName: aString [

	name := aString
]

{ #category : #private }
Feature >> setValues: aCollection [

	values := aCollection
]
