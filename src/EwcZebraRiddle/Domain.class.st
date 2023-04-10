Class {
	#name : #Domain,
	#superclass : #Object,
	#instVars : [
		'tuples',
		'mainFeature'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Domain class >> withFeatures: aCollection [
	^ Domain new
		setTuples: aCollection asOrderedCollection;
		yourself
]

{ #category : #private }
Domain >> asItems [
	| dict |
	dict := OrderPreservingDictionary new.
	tuples
		do: [ :each | 
			dict at: each key ifAbsentPut: [ OrderedCollection new ].
			(dict at: each key) add: each value ].
	^ dict associations
]

{ #category : #conversion }
Domain >> constraintId: anId withFeatures: aCollection [
	^ Constraint withId: anId andFeatures: (aCollection select: [:each | tuples contains: [:item | item = each]]).
]

{ #category : #accessing }
Domain >> constraintValues: aCollection [
	^ tuples select: [:each | aCollection includes: each value ].
]

{ #category : #accessing }
Domain >> features [
	^ (self asItems collect: [ :each | each key ]) asOrderedCollection
]

{ #category : #accessing }
Domain >> getFeature: aName withValue: aValue [
	^ tuples detect: [:tuple | (tuple key = aName) and: (tuple value = aValue)]
]

{ #category : #'view creation' }
Domain >> gtValuesByFeatureFor: aView [
	<gtView>
	^ aView groupedList
		title: 'Допустимые значения';
		priority: 1;
		groupedItems: self asItems.
		
]

{ #category : #private }
Domain >> mainFeatureName [
	^ self asItems first key
]

{ #category : #private }
Domain >> mainFeatureValue [
	^ self asItems first value
]

{ #category : #private }
Domain >> setTuples: aCollection [
	tuples := OrderedCollection new.
	aCollection do: [ :each | tuples addAll: each ]
]
