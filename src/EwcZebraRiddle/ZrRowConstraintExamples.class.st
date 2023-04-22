Class {
	#name : #ZrRowConstraintExamples,
	#superclass : #Object,
	#category : #'EwcZebraRiddle-Examples'
}

{ #category : #example }
ZrRowConstraintExamples >> contradictiveConstraints [
	"Два строковых условия считаются противоречивыми, если содержат разные значения одной и той же характеристики"

	<gtExample>
	| constraint contradictoryConstraint |
	constraint := self rowConstrainWithTwoFeatures.
	contradictoryConstraint := ZrRowConstraint
			withId: '2'
			andValues: {#британец.
					1}
			from: self domain.
	self assert: [constraint contradicts: contradictoryConstraint]
]

{ #category : #example }
ZrRowConstraintExamples >> domain [
	^ ZebraRiddleExamples new domain
]

{ #category : #example }
ZrRowConstraintExamples >> nonOverlappingConstraints [
	"Два строковых условия невозможно объединить, если у них нет общей черты"
	<gtExample>
	| constraint anotherConstraint |
	constraint := self rowConstrainWithTwoFeatures.
	anotherConstraint := ZrRowConstraint
			withId: '2'
			andValues: {#кошки.
					2}
			from: self domain.
	self assert: [(constraint complements: anotherConstraint) not] 
]

{ #category : #example }
ZrRowConstraintExamples >> rowConstrainWithTwoFeatures [
	<gtExample>
	^ ZrRowConstraint
		withId: '1'
		andValues: {#немец.
				#пиво}
		from: self domain
]

{ #category : #example }
ZrRowConstraintExamples >> rowConstraintCannotHaveManyValuesForTheSameFeature [
	<gtExample>
	| constraint |
	constraint := ZrRowConstraint
			withId: '1'
			andValues: {#красный.
					#зеленый.
					#желтый}
			from: self domain.

	self
		assert: [ (constraint includes: #красный) not ]
		description: 'Значение "красный" должно быть перезаписано'.
	self
		assert: [ (constraint includes: #зеленый) not ]
		description: 'Значение "зеленый" должно быть перезаписано'.

	^ constraint
]

{ #category : #example }
ZrRowConstraintExamples >> rowConstraintWithOnlyDomainValues [
	<gtExample>
	| constraint |
	constraint := ZrRowConstraint
			withId: '1'
			andValues: {#черный.
					1}
			from: self domain.

	self
		assert: [ (constraint includes: #черный) not ]
		description: 'Значение "черный" не входит в область допустимых значений'.

	^ constraint
]
