Class {
	#name : #ZrRowConstraint,
	#superclass : #Object,
	#instVars : [
		'id',
		'values',
		'features'
	],
	#category : #'EwcZebraRiddle-Behavior'
}

{ #category : #'instance creation' }
ZrRowConstraint class >> withId: aString andValues: aCollection from: aDomain [
	^ ZrRowConstraint new
		setId: aString;
		setFeatures: (aDomain features);
		setValues: (aDomain constraintValues: aCollection);
		yourself
]

{ #category : #view }
ZrRowConstraint >> gtConstraintTableFor: aView [
	<gtView>
	| view |
	view := aView columnedList
			title: 'Таблица ограничений';
			priority: 1;
			items: (Entity withFeatures: values) asOrderedCollection.
	features
		do: [ :each | view column: each text: [ :entity | entity featureValue: each ] ].
	^ view
]

{ #category : #testing }
ZrRowConstraint >> includes: anAssoc [
	^ values includes: anAssoc.
]

{ #category : #private }
ZrRowConstraint >> setFeatures: aCollection [
	features := aCollection
]

{ #category : #private }
ZrRowConstraint >> setId: aString [ 
	id := aString
]

{ #category : #private }
ZrRowConstraint >> setValues: aCollection [
	values := aCollection 
]
