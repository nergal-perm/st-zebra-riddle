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
ZebraRiddleExamples >> minimumViablePuzzle [
	<gtExample>
	| puzzle |
	puzzle := Puzzle
			withFeatures: {Feature withName: 'Номер дома' andValues: #(1 2 3 4 5)}
			andEntityCount: 5.

	^ puzzle
]
