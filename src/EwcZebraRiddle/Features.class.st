Class {
	#name : #Features,
	#superclass : #Object,
	#instVars : [
		'features'
	],
	#category : #'EwcZebraRiddle-Core'
}

{ #category : #'instance creation' }
Features class >> withFeatures: aCollection [
	^ Features new setFeatures: aCollection
]

{ #category : #accessing }
Features >> first [
	^ features first
]

{ #category : #accessing }
Features >> houseColor: aHouseColor [
	^ (features detect: [ :feature | feature hasName: #'Цвет дома' ])
		asFeatureValue: aHouseColor
]

{ #category : #accessing }
Features >> nationality: aNationality [
	^ (features detect: [ :feature | feature hasName: #Национальность ])
		asFeatureValue: aNationality
]

{ #category : #accessing }
Features >> setFeatures: aCollection [ 
	features := aCollection
]
