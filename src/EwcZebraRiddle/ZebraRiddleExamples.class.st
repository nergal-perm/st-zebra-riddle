Class {
	#name : #ZebraRiddleExamples,
	#superclass : #Object,
	#category : #'EwcZebraRiddle-Examples'
}

{ #category : #accessing }
ZebraRiddleExamples >> emptyPuzzle [
	<gtExample>
	| puzzle |
	puzzle := Puzzle withFeatures: #() andEntityCount: 0.

	self assert: puzzle isEmpty.
	
	^ puzzle
]

{ #category : #accessing }
ZebraRiddleExamples >> featureAnimal [
	<gtExample>
	^ Feature withName: 'Питомцы' andValues: #('собаки' 'птицы' 'коты' 'лошади' 'рыбы')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureCigarettes [
	<gtExample>
	^ Feature withName: 'Сигареты' andValues: #('Prince' 'Pall-Mall' 'Dunhill' 'Blends' 'Blue Master')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureDrink [
	<gtExample>
	^ Feature withName: 'Напиток' andValues: #('чай' 'кофе' 'молоко' 'пиво' 'вода')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureHouseColor [
	<gtExample>
	^ Feature withName: 'Цвет дома' andValues: #('красный' 'зеленый' 'желтый' 'синий' 'белый')
]

{ #category : #accessing }
ZebraRiddleExamples >> featureHouseOrder [
	<gtExample>
	^ Feature withName: 'Номер дома' andValues: #(1 2 3 4 5)
]

{ #category : #accessing }
ZebraRiddleExamples >> featureNationality [
	<gtExample>
	^ Feature withName: 'Национальность' andValues: #('британец' 'швед' 'датчанин' 'норвежец' 'немец')
]

{ #category : #accessing }
ZebraRiddleExamples >> minimumViablePuzzle [
	<gtExample>
	<description: 'Минимально допустимое состояние загадки Эйнштейна'>
	| puzzle |
	puzzle := Puzzle
			withFeatures: {self featureHouseOrder}
			andEntityCount: 5.

	^ puzzle
]
