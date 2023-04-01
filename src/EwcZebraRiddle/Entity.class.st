Class {
	#name : #Entity,
	#superclass : #Object,
	#instVars : [
		'features'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #accessing }
Entity class >> withFeatures: values [
	| entity |
	entity := Entity new.
	values do: [ :each | entity addFeature: each ].
	^ entity
]

{ #category : #accessing }
Entity >> addFeature: aFeature [
	self addFeature: aFeature key withValue: aFeature value
]

{ #category : #accessing }
Entity >> addFeature: aFeature withValue: aValue [
	features at: aFeature put: aValue. 
]

{ #category : #accessing }
Entity >> featureValue: aFeatureType [
	^ features at: aFeatureType ifAbsent: '*'
]

{ #category : #accessing }
Entity >> initialize [
	features := Dictionary new
]

{ #category : #accessing }
Entity >> isEntity [
	^ true
]
