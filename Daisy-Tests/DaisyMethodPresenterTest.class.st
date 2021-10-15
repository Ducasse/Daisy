"
A DaisyMethodPresenterTest is a test class for testing the behavior of DaisyMethodPresenter
"
Class {
	#name : #DaisyMethodPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'daisyMethodPresenter'
	],
	#category : #'Daisy-Tests'
}

{ #category : #running }
DaisyMethodPresenterTest >> setUp [

	super setUp.
	daisyMethodPresenter := DaisyMethodPresenter new
]

{ #category : #tests }
DaisyMethodPresenterTest >> testNewEmpty [

	self assertEmpty: daisyMethodPresenter codePresenter text
]

{ #category : #tests }
DaisyMethodPresenterTest >> testNewWithMethod [

	| compiledMethod |
	compiledMethod := Point >> #degrees.

	daisyMethodPresenter onMethod: compiledMethod.
	self
		assert: daisyMethodPresenter methodCode
		equals: compiledMethod sourceCode.
	self
		assert: daisyMethodPresenter selector
		equals: compiledMethod selector.
	self
		assert: daisyMethodPresenter methodClassName
		equals: compiledMethod methodClass name.
	self
		assert: daisyMethodPresenter isClassSide
		equals: compiledMethod  methodClass isClassSide
]

{ #category : #tests }
DaisyMethodPresenterTest >> testOpen [

	| window |
	window := DaisyMethodPresenter open.
	self assert: window isBuilt.
	window close
]
