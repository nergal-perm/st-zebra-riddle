Class {
	#name : #ZebraRiddleExamples,
	#superclass : #Object,
	#category : #'EwcZebraRiddle-Examples'
}

{ #category : #accessing }
ZebraRiddleExamples >> animal [
	^ #Животное
]

{ #category : #accessing }
ZebraRiddleExamples >> domain [
	<gtExample>
	| describedDomain |
	describedDomain := Domain
			withFeatures: {self featureHouseOrder.
					self featureNationality.
					self featureHouseColor.
					self featureDrink.
					self featureCigarettes.
					self featureAnimal}.
	describedDomain mainFeature: #'Номер дома'.
	^ describedDomain 
]

{ #category : #accessing }
ZebraRiddleExamples >> domainForFeature: name withValues: values [
	^ values collect: [ :each | name -> each ]
]

{ #category : #accessing }
ZebraRiddleExamples >> drink [
	^ #Напиток
]

{ #category : #accessing }
ZebraRiddleExamples >> emptyPuzzle [
	<gtExample>
	| puzzle |
	puzzle := Puzzle withDomain: #() andEntityCount: 0.

	self assert: puzzle isEmpty.
	
	^ puzzle
]

{ #category : #accessing }
ZebraRiddleExamples >> featureAnimal [
	<gtExample>
	^ self domainForFeature: self animal withValues: #('собаки' 'птицы' 'коты' 'лошади' 'рыбы')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureCigarettes [
	<gtExample>
	^ self domainForFeature: #Сигареты withValues: #('Prince' 'Pall-Mall' 'Dunhill' 'Blends' 'Blue Master')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureDrink [
	<gtExample>
	^ self domainForFeature: #Напиток withValues: #('чай' 'кофе' 'молоко' 'пиво' 'вода')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureHouseColor [
	<gtExample>
	^ self domainForFeature: #'Цвет дома' withValues: #('красный' 'зеленый' 'желтый' 'синий' 'белый')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureHouseOrder [
	<gtExample>
	^ self domainForFeature: #'Номер дома' withValues: #(1 2 3 4 5)
]

{ #category : #accessing }
ZebraRiddleExamples >> featureNationality [
	<gtExample>
	^ self domainForFeature: #Национальность withValues: #('британец' 'швед' 'датчанин' 'норвежец' 'немец') 
]

{ #category : #accessing }
ZebraRiddleExamples >> houseColor [
	^ #'Цвет дома'
]

{ #category : #accessing }
ZebraRiddleExamples >> minimumViablePuzzle [
	<gtExample>
	<description: 'Минимально допустимое состояние загадки Эйнштейна'>
	| puzzle |
	puzzle := Puzzle
			withDomain: self domain
			andEntityCount: 5.

	^ puzzle
]

{ #category : #accessing }
ZebraRiddleExamples >> nationality [
	^ #Национальность
]

{ #category : #accessing }
ZebraRiddleExamples >> puzzleWithSimpleConstraints [
	<gtExample>
	| puzzle features |
	features := self domain.
	puzzle := self minimumViablePuzzle.

	puzzle
		addConstraint: (features
				constraintId: '1'
				withFeatures: {self nationality -> #британец.
						self houseColor -> #красный});
		addConstraint: (features
				constraintId: '2'
				withFeatures: {self nationality -> #швед.
						self animal -> #собаки});
		addConstraint: (features
				constraintId: '3'
				withFeatures: {self nationality -> #датчанин.
						self drink -> #чай}).


	^ puzzle
]

{ #category : #accessing }
ZebraRiddleExamples >> simpleConstraint [
	<gtExample>
	| domain |
	domain := self domain.
	
	^ domain constraintId: #'1' withFeatures: { #Национальность -> #британец . #'Цвет дома' -> #красный}.
]
