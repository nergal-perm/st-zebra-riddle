Class {
	#name : #Constraint,
	#superclass : #Object,
	#instVars : [
		'entities'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #accessing }
Constraint class >> withEntities: aCollection [
	^ Constraint new entities: aCollection asOrderedCollection
]

{ #category : #converting }
Constraint >> asBrItemsProvider [
	^ BrSequenceableCollectionItemsProvider forCollection: self entities
]

{ #category : #accessing }
Constraint >> entities [
	^ entities
]

{ #category : #accessing }
Constraint >> entities: aCollection [
	entities := aCollection
]

{ #category : #accessing }
Constraint >> gtConstraintTableFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Таблица ограничений';
		priority: 1;
		items: entities;
		column: #'Номер дома' text: [ :entity | entity featureValue: #'Номер дома'];
		column: 'Национальность'
			text: [ :entity | entity featureValue: #nationality ];
		column: 'Цвет дома' text: [ :entity | entity featureValue: #houseColor ];
		column: 'Напиток' text: [ :entity | entity featureValue: #drink ];
		column: 'Сигареты' text: [ :entity | entity featureValue: #cigarettes ];
		column: 'Животное' text: [ :entity | entity featureValue: #animal ]
]

{ #category : #accessing }
Constraint >> isEntity [
	^ false
]
