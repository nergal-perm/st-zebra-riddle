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
	| features |
	features := (self asItems collect: [:each | each key]) asOrderedCollection.
	features remove: mainFeature.
	features addFirst: mainFeature.
	^ features
]

{ #category : #accessing }
Domain >> getFeature: aName withValue: aValue [
	^ tuples detect: [:tuple | (tuple key = aName) and: (tuple value = aValue)]
]

{ #category : #accessing }
Domain >> getMainFeatureWithValue: aValue [
	^ self getFeature: mainFeature withValue: aValue
]

{ #category : #'view creation' }
Domain >> gtValuesByFeatureFor: aView [
	<gtView>
	^ aView groupedList
		title: 'Допустимые значения';
		priority: 1;
		groupedItems: self asItems.
		
]

{ #category : #accessing }
Domain >> mainFeature: aFeatureName [
	mainFeature := aFeatureName
]

{ #category : #private }
Domain >> setTuples: aCollection [
	tuples := OrderedCollection new.
	aCollection do: [ :each | tuples addAll: each ]
]
