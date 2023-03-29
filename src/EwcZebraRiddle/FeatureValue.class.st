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
FeatureValue class >> cigarettes [
	^ FeatureValue new
		type: #cigarettes;
		yourself.
]

{ #category : #accessing }
FeatureValue class >> houseColor [
	^ FeatureValue new
		type: #houseColor;
		yourself.
]

{ #category : #accessing }
FeatureValue class >> houseOrder [
	^ FeatureValue new
		type: #houseOrder;
		yourself.
]

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