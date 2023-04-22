Class {
	#name : #ZrRowConstraint,
	#superclass : #Object,
	#instVars : [
		'id',
		'values',
		'features'
	],
	#category : #'EwcZebraRiddle-Behavior'
}

{ #category : #'instance creation' }
ZrRowConstraint class >> withId: aString andValues: aCollection from: aDomain [
	^ ZrRowConstraint new
		setId: aString;
		setValues: (aDomain constraintValues: aCollection);
		yourself
]

{ #category : #testing }
ZrRowConstraint >> complements: aConstraint [
	^ (aConstraint hasCommonFeatures: values) & (self contradicts: aConstraint) not
]

{ #category : #accessing }
ZrRowConstraint >> contradicts: aConstraint [
	^ aConstraint hasSameFeatureWithDifferentValue: values
]

{ #category : #accessing }
ZrRowConstraint >> entities [
	^ (Entity withFeatures: values associations) asOrderedCollection
]

{ #category : #testing }
ZrRowConstraint >> hasCommonFeatures: aDictionary [
	| sameFeatures |
	sameFeatures := values keys intersection: aDictionary keys.
	^ sameFeatures isNotEmpty
]

{ #category : #testing }
ZrRowConstraint >> hasSameFeatureWithDifferentValue: aDictionary [
	| sameFeatures |
	sameFeatures := values keys intersection: aDictionary keys.
	^ (sameFeatures
		allSatisfy: [ :each | (values at: each) = (aDictionary at: each) ]) not
]

{ #category : #accessing }
ZrRowConstraint >> id [
	^ id
]

{ #category : #testing }
ZrRowConstraint >> includes: aValue [
	^ values asDictionary includes: aValue.
]

{ #category : #testing }
ZrRowConstraint >> isEntity [
	^ false
]

{ #category : #private }
ZrRowConstraint >> setId: aString [ 
	id := aString
]

{ #category : #private }
ZrRowConstraint >> setValues: aCollection [
	values := aCollection 
]
