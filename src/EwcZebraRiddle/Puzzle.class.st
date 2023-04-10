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

{ #category : #'view creation' }
Puzzle >> constraintValueBlockFor: feature [
	^ [ :each | each isEntity ifTrue: [ each featureValue: feature ] ifFalse: [ '' ] ]
]

{ #category : #accessing }
Puzzle >> gtConstraints [
	^ constraints
		flatCollect: [ :each | 
			(each isKindOf: AlternativeConstraint)
				ifTrue: [ each alternatives ]
				ifFalse: [ {each} ] ]
]

{ #category : #accessing }
Puzzle >> gtPuzzleConstraintsFor: aView [
	<gtView>
	| resultingView |
	resultingView := aView columnedTree
			title: 'Условия';
			priority: 1;
			items: self gtConstraints;
			children: [ :each | each isEntity ifTrue: [ #() ] ifFalse: [ each entities ] ];
			column: #Ид
				text: [ :each | each isEntity ifTrue: [ '' ] ifFalse: [ each id ] ].

	domain features
		do: [ :feature | resultingView column: feature text: (self constraintValueBlockFor: feature) ].


	^ resultingView
]

{ #category : #accessing }
Puzzle >> gtPuzzleCurrentStateFor: aView [
	<gtView>
	^ aView forward
		title: 'Текущее состояние';
		priority: 2;
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
Puzzle >> setDomain: aDomain andEntityCount: anInteger [
	domain := aDomain.
	entityCount := anInteger.

	currentState := Constraint
			withEntities: ((1 to: entityCount)
					collect: [ :each | 
						Entity new
							addFeature: domain mainFeatureName -> (domain mainFeatureValue at: each) ])
]
