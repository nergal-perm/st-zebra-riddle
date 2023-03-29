Class {
	#name : #Domain,
	#superclass : #Object,
	#instVars : [
		'features',
		'tuples'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Domain class >> withFeatures: aCollection [
	^ Domain new
		setFeatures: aCollection;
		setTuples: aCollection;
		yourself
]

{ #category : #private }
Domain >> asItems [
	| dict |
	dict := Dictionary new.
	tuples
		do: [ :each | 
			dict at: each key ifAbsentPut: [ OrderedCollection new ].
			(dict at: each key) add: each value ].
	^ dict associations
]

{ #category : #accessing }
Domain >> first [
	^ features first
]

{ #category : #accessing }
Domain >> getFeature: aName withValue: aValue [
		^ (features detect: [ :feature | feature hasName: aName ])
		asFeatureValue: aValue
]

{ #category : #accessing }
Domain >> gtValuesByFeatureFor: aView [
	<gtView>
	^ aView groupedList
		title: 'Допустимые значения';
		priority: 1;
		groupedItems: self asItems.
		
]

{ #category : #accessing }
Domain >> houseColor: aHouseColor [
	^ (features detect: [ :feature | feature hasName: #'Цвет дома' ])
		asFeatureValue: aHouseColor
]

{ #category : #accessing }
Domain >> nationality: aNationality [
	^ (features detect: [ :feature | feature hasName: #Национальность ])
		asFeatureValue: aNationality
]

{ #category : #private }
Domain >> setFeatures: aCollection [ 
	features := aCollection
]

{ #category : #'instance creation' }
Domain >> setTuples: aCollection [
	tuples := OrderedCollection new.
	aCollection do: [ :feature | tuples addAll: feature asTuples ]
]
