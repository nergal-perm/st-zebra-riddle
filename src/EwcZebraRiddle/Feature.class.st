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

{ #category : #private }
Feature >> setName: aString [

	name := aString
]

{ #category : #private }
Feature >> setValues: aCollection [

	values := aCollection
]
