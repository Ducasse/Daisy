"
I am a model for holding information of a compiled method. I am a pre alpha version
"
Class {
	#name : #DaisyMethodDefinition,
	#superclass : #Object,
	#instVars : [
		'methodClassName',
		'selector',
		'source',
		'isClassSide',
		'isExtension',
		'protocol'
	],
	#category : #Daisy
}

{ #category : #initialization }
DaisyMethodDefinition >> initialize [

	| compiledMethod |
	compiledMethod := Collection >> #do:.
	methodClassName := compiledMethod methodClass name.
	selector := compiledMethod selector.
	source := compiledMethod sourceCode.
	isClassSide := compiledMethod methodClass isClassSide.
	isExtension := false.
	protocol := compiledMethod protocol
]

{ #category : #accessing }
DaisyMethodDefinition >> isClassSide [

	^ isClassSide
]

{ #category : #accessing }
DaisyMethodDefinition >> isClassSide: anObject [

	isClassSide := anObject
]

{ #category : #accessing }
DaisyMethodDefinition >> isExtension [

	^ isExtension
]

{ #category : #accessing }
DaisyMethodDefinition >> isExtension: anObject [

	isExtension := anObject
]

{ #category : #accessing }
DaisyMethodDefinition >> methodClassName [

	^ methodClassName
]

{ #category : #accessing }
DaisyMethodDefinition >> methodClassName: anObject [

	methodClassName := anObject
]

{ #category : #accessing }
DaisyMethodDefinition >> protocol [

	^ protocol
]

{ #category : #accessing }
DaisyMethodDefinition >> protocol: anObject [

	protocol := anObject
]

{ #category : #accessing }
DaisyMethodDefinition >> selector [

	^ selector
]

{ #category : #accessing }
DaisyMethodDefinition >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
DaisyMethodDefinition >> source [

	^ source
]

{ #category : #accessing }
DaisyMethodDefinition >> source: anObject [

	source := anObject
]
