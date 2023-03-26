Class {
	#name : #Puzzle,
	#superclass : #Object,
	#instVars : [
		'constraints'
	],
	#category : #EwcZebraRiddle
}

{ #category : #accessing }
Puzzle >> addConstraint: aConstraint [ 
	constraints add: aConstraint
]

{ #category : #accessing }
Puzzle >> initialize [
	constraints := OrderedCollection new.
]
