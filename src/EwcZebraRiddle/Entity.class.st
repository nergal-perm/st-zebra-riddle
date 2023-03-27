Class {
	#name : #Entity,
	#superclass : #Object,
	#instVars : [
		'features'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #accessing }
Entity >> addFeature: aFeature [
	features at: (aFeature type) put: (aFeature value)
	 
]

{ #category : #accessing }
Entity >> addFeature: aFeature withValue: aValue [
	features at: aFeature type put: aValue. 
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
