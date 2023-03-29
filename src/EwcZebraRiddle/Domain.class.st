Class {
	#name : #Domain,
	#superclass : #Object,
	#instVars : [
		'features',
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
	aCollection do: [ :feature | tuples addAll: feature asTuples ]
]
