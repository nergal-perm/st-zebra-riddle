Class {
	#name : #ZrBehaviorExamples,
	#superclass : #Object,
	#category : #'EwcZebraRiddle-Examples'
}

{ #category : #example }
ZrBehaviorExamples >> domain [
	^ ZebraRiddleExamples new domain
]

{ #category : #example }
ZrBehaviorExamples >> rowConstrainWithTwoFeatures [
	<gtExample>
	^ ZrRowConstraint
		withId: '1'
		andValues: {#немец.
				#пиво}
		from: self domain
]

{ #category : #example }
ZrBehaviorExamples >> rowConstraintCannotHaveManyValuesForTheSameFeature [
	<gtExample>
	^ domain
]

{ #category : #example }
ZrBehaviorExamples >> rowConstraintShouldContainOnlyDomainValues [
	<gtExample>
	| constraint |
	constraint := ZrRowConstraint
			withId: '1'
			andValues: {#черный.
					1}
			from: self domain.

	self
		assert: [ (constraint includes: #'Цвет дома' -> #черный) not ]
		description: 'Значение "черный" не входит в область допустимых значений'.

	^ constraint
]

{ #category : #example }
ZrBehaviorExamples >> testRowConstraintShouldContainOnlyDomainValues [
	<gtExample>
	| constraint |
	constraint := ZrRowConstraint
			withId: '1'
			andValues: {#черный.
					1}
			from: self domain.

	self
		assert: [ (constraint includes: #'Цвет дома' -> #черный) not ]
		description: 'Значение "черный" не входит в область допустимых значений'.

	^ constraint
]
