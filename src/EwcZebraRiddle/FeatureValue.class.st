Class {
	#name : #FeatureValue,
	#superclass : #Object,
	#instVars : [
		'type',
		'value'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #accessing }
FeatureValue >> type [
	^ type
]

{ #category : #accessing }
FeatureValue >> type: aString [ 
	type := aString
]

{ #category : #accessing }
FeatureValue >> value [
	^ value
]

{ #category : #accessing }
FeatureValue >> withValue: aValue [
	value := aValue
]
