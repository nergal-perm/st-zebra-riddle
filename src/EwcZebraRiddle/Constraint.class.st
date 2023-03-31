Class {
	#name : #Constraint,
	#superclass : #Object,
	#instVars : [
		'entities',
		'id'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Constraint class >> withEntities: aCollection [
	^ Constraint new entities: aCollection asOrderedCollection
]

{ #category : #'instance creation' }
Constraint class >> withEntities: aCollection andId: anId [
	^ Constraint new 
		entities: aCollection asOrderedCollection;
		id: anId.
]

{ #category : #'instance creation' }
Constraint class >> withId: anId andFeatures: aKeyValuePairCollection [ 
	| entity |
	entity := Entity new.
	aKeyValuePairCollection do: [:each | entity addFeature: each key withValue: each value ].
	^ self withEntities: { entity } andId: anId
]

{ #category : #accessing }
Constraint >> and: anOtherConstraint [
	| newEntities |
	newEntities := OrderedCollection new.
	newEntities addAll: self entities.
	newEntities addAll: anOtherConstraint entities.
	^ self class withEntities: newEntities andId: (id , anOtherConstraint id)
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
			text: [ :entity | entity featureValue: #Национальность ];
		column: 'Цвет дома' text: [ :entity | entity featureValue: #'Цвет дома' ];
		column: 'Напиток' text: [ :entity | entity featureValue: #Напиток ];
		column: 'Сигареты' text: [ :entity | entity featureValue: #Сигареты ];
		column: 'Животное' text: [ :entity | entity featureValue: #Животное ]
]

{ #category : #accessing }
Constraint >> id [
	^ id
]

{ #category : #accessing }
Constraint >> id: anId [ 
	id := anId
]

{ #category : #accessing }
Constraint >> isEntity [
	^ false
]

{ #category : #accessing }
Constraint >> or: anOtherConstraint [
	^ AlternativeConstraint
		withAlternatives: {self.
				anOtherConstraint}
]
