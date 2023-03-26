Class {
	#name : #BaselineOfEwcZebraRiddle,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfEwcZebraRiddle
}

{ #category : #accessing }
BaselineOfEwcZebraRiddle class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'nergal-perm'
				/ 'st-zebra-riddle' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #accessing }
BaselineOfEwcZebraRiddle >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec postLoadDoIt: #postLoadBaseline:.
			spec package: 'EwcZebraRiddle' ]
]

{ #category : #accessing }
BaselineOfEwcZebraRiddle >> postLoadBaseline: spec [
	(PostLoaded isNotNil and: [ PostLoaded ]) ifTrue: [ ^ self ].
	PostLoaded := true.

	self class loadLepiter
]
