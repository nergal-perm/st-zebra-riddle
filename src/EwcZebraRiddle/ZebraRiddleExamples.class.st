Class {
	#name : #ZebraRiddleExamples,
	#superclass : #Object,
	#category : #'EwcZebraRiddle-Examples'
}

{ #category : #accessing }
ZebraRiddleExamples >> Blends_Near_Cats_10 [
	<gtExample> 
	| constraint1 constraint2 |
	constraint1 := self domain constraintId: '10' withFeatures: { self cigarettes -> #Blends}.
	constraint2 := self domain constraintId: '' withFeatures: { self animal -> #коты }.
	
	^ (constraint1 and: constraint2) or: (constraint2 and: constraint1).
]

{ #category : #accessing }
ZebraRiddleExamples >> Blends_Near_Water_15 [
	<gtExample> 
	| constraint1 constraint2 |
	constraint1 := self domain constraintId: '15' withFeatures: { self cigarettes -> #Blends}.
	constraint2 := self domain constraintId: '' withFeatures: { self drink -> #вода }.
	
	^ (constraint1 and: constraint2) or: (constraint2 and: constraint1).
]

{ #category : #accessing }
ZebraRiddleExamples >> BlueMaster_Beer_12 [
	<gtExample>
	^ ZrRowConstraint
		withId: '12'
		andValues: {#'Blue Master'.
				#пиво}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> British_Red_1 [
	<gtExample>
	^ ZrRowConstraint
		withId: '1'
		andValues: {#британец.
				#красный}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Dunhill_Near_Horses_11 [
	<gtExample> 
	| constraint1 constraint2 |
	constraint1 := self domain constraintId: '11' withFeatures: { self cigarettes -> #Dunhill}.
	constraint2 := self domain constraintId: '' withFeatures: { self animal -> #лошади }.
	
	^ (constraint1 and: constraint2) or: (constraint2 and: constraint1).
]

{ #category : #accessing }
ZebraRiddleExamples >> Dutch_Tea_3 [
	<gtExample>
	^ ZrRowConstraint
		withId: '3'
		andValues: {#датчанин.
				#чай}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> First_Norwegian_9 [
	<gtExample>
	^ ZrRowConstraint
		withId: '9'
		andValues: {1.
				#норвежец}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> German_Prince_13 [
	<gtExample>
	^ ZrRowConstraint
		withId: '13'
		andValues: {#немец.
				#Prince}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Green_Coffee_5 [
	<gtExample>
	^ ZrRowConstraint
		withId: '5'
		andValues: {#зеленый.
				#кофе}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Green_Then_White_4 [
	<gtExample>
	| constraint1 constraint2 |
	constraint1 := self domain constraintId: '4' withFeatures: { self houseColor -> #'зеленый'}.
	constraint2 := self domain constraintId: '' withFeatures: { self houseColor -> #'белый' }.
	
	^ constraint1 and: constraint2.
]

{ #category : #accessing }
ZebraRiddleExamples >> Norwegian_Near_Blue_14 [
	<gtExample> 
	| constraint1 constraint2 |
	constraint1 := self domain constraintId: '14' withFeatures: { self nationality -> #норвежец}.
	constraint2 := self domain constraintId: '' withFeatures: { self houseColor -> #синий }.
	
	^ (constraint1 and: constraint2) or: (constraint2 and: constraint1).
]

{ #category : #accessing }
ZebraRiddleExamples >> PallMall_Birds_6 [
	<gtExample>
	^ ZrRowConstraint
		withId: '6'
		andValues: {#'Pall-Mall'.
				#птицы}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Swede_Dog_2 [
	<gtExample>
	^ ZrRowConstraint
		withId: '2'
		andValues: {#швед.
				#собаки}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Third_Milk_8 [
	<gtExample>
	^ ZrRowConstraint
		withId: '8'
		andValues: {3.
				#молоко}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> Yellow_Dunhill_7 [
	<gtExample>
	^ ZrRowConstraint
		withId: '7'
		andValues: {#Dunhill.
				#желтый}
		from: self domain
]

{ #category : #accessing }
ZebraRiddleExamples >> animal [
	^ #Животное
]

{ #category : #accessing }
ZebraRiddleExamples >> cigarettes [
	^ #Сигареты
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
	^ self domainForFeature: #Национальность withValues: #(#британец #швед #датчанин #норвежец #немец) 
]

{ #category : #accessing }
ZebraRiddleExamples >> houseColor [
	^ #'Цвет дома'
]

{ #category : #accessing }
ZebraRiddleExamples >> houseNumber [
	^ #'Номер дома'
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
	| puzzle |
	puzzle := self minimumViablePuzzle.

	puzzle
		addConstraint: self British_Red_1;
		addConstraint: self Swede_Dog_2;
		addConstraint: self Dutch_Tea_3;
		addConstraint: self Green_Then_White_4;
		addConstraint: self Green_Coffee_5;
		addConstraint: self PallMall_Birds_6;
		addConstraint: self Yellow_Dunhill_7;
		addConstraint: self Third_Milk_8;
		addConstraint: self First_Norwegian_9;
		addConstraint: self Blends_Near_Cats_10;
		addConstraint: self Dunhill_Near_Horses_11;
		addConstraint: self BlueMaster_Beer_12;
		addConstraint: self German_Prince_13;
		addConstraint: self Norwegian_Near_Blue_14;
		addConstraint: self Blends_Near_Water_15.

	^ puzzle
]

{ #category : #accessing }
ZebraRiddleExamples >> simpleConstraint [
	<gtExample>
	| domain |
	domain := self domain.
	
	^ domain constraintId: #'1' withFeatures: { #Национальность -> #британец . #'Цвет дома' -> #красный}.
]
