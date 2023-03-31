Class {
	#name : #AlternativeConstraint,
	#superclass : #Object,
	#instVars : [
		'alternatives'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
AlternativeConstraint class >> withAlternatives: aCollection [
	aCollection doWithIndex: [ :each :index | each id: (each id , '-', index asString)].
	^ self new setAlternatives: aCollection.
	
]

{ #category : #accessing }
AlternativeConstraint >> alternatives [
	^ alternatives
]

{ #category : #accessing }
AlternativeConstraint >> gtConstraintTableFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Таблица ограничений';
		priority: 1;
		items: alternatives;
		children: [ :each | each isEntity ifTrue: [ #() ] ifFalse: [ each entities ] ];
		column: #Ид
			text: [ :each | each isEntity ifTrue: [ '' ] ifFalse: [ each id ] ];
		column: #'Номер дома'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #'Номер дома' ] ifFalse: [ '' ] ];
		column: 'Национальность'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #Национальность ] ifFalse: [ '' ] ];
		column: 'Цвет дома'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #'Цвет дома' ] ifFalse: [ '' ] ];
		column: 'Напиток'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #Напиток ] ifFalse: [ '' ] ];
		column: 'Сигареты'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #Сигареты ] ifFalse: [ '' ] ];
		column: 'Животное'
			text: [ :each | each isEntity ifTrue: [ each featureValue: #Животное ] ifFalse: [ '' ] ]
]

{ #category : #private }
AlternativeConstraint >> setAlternatives: aCollection [
	alternatives := aCollection
]
