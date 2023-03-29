Class {
	#name : #Puzzle,
	#superclass : #Object,
	#instVars : [
		'constraints',
		'domain',
		'entityCount',
		'currentState'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Puzzle class >> withDomain: aCollection andEntityCount: anInteger [
	^ Puzzle new
		setDomain: aCollection andEntityCount: anInteger;
		yourself.
]

{ #category : #accessing }
Puzzle >> addConstraint: aConstraint [ 
	constraints add: aConstraint
]

{ #category : #accessing }
Puzzle >> gtPuzzleCurrentStateFor: aView [
	<gtView>
	^ aView forward
		title: 'Текущее состояние';
		priority: 1;
		object: currentState;
		view: #gtConstraintTableFor:
		
]

{ #category : #accessing }
Puzzle >> initialize [
	constraints := OrderedCollection new.
]

{ #category : #accessing }
Puzzle >> isEmpty [
	^ features isEmpty and: entityCount = 0
]

{ #category : #private }
Puzzle >> setDomain: aCollection andEntityCount: anInteger [
	domain := aCollection.
	entityCount := anInteger.

	currentState := Constraint
			withEntities: ((1 to: entityCount)
					collect: [ :each | Entity new addFeature: (domain getMainFeatureWithValue: each) ])
]
