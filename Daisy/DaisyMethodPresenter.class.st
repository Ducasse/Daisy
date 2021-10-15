"
- add menu based on command to manage a bit the method
	- senders/implementors

- Dropbox for specifying the class

- Command for compiling a method on class

- List of visited class for the drop box

- Pin for unclosable window 


- Scenario 1
	read existing method

- Scenario 2
	redefines an existing method
	
- Scenario 3
	define a new version from an existing one
	
- Scenario 4 
	define a new method from scratch
"
Class {
	#name : #DaisyMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codePresenter',
		'methodDefinition',
		'label',
		'classSideRadioButton'
	],
	#category : #Daisy
}

{ #category : #api }
DaisyMethodPresenter class >> open [

	^ self new openWithSpec
]

{ #category : #accessing }
DaisyMethodPresenter >> codePresenter [
	^ codePresenter
]

{ #category : #initialization }
DaisyMethodPresenter >> initialize [

	methodDefinition := DaisyMethodDefinition new.
	super initialize.
]

{ #category : #initialization }
DaisyMethodPresenter >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			add: label expand: false;
			add: classSideRadioButton expand: false;
			yourself)
		expand: false;
		add: codePresenter;
		yourself)
]

{ #category : #initialization }
DaisyMethodPresenter >> initializePresenters [

	codePresenter := self newCode.
	codePresenter text: methodDefinition source.
	label := self newLabel.
	label label: methodDefinition methodClassName.
	classSideRadioButton := self newCheckBox.
	classSideRadioButton
		label: 'Class side';
		state: methodDefinition isClassSide.
	self initializeLayout
]

{ #category : #accessing }
DaisyMethodPresenter >> isClassSide [
	^ methodDefinition isClassSide
]

{ #category : #accessing }
DaisyMethodPresenter >> methodClassName [
	^ methodDefinition methodClassName
]

{ #category : #accessing }
DaisyMethodPresenter >> methodCode [

	^ codePresenter text
]

{ #category : #api }
DaisyMethodPresenter >> onMethod: aCompiledMethod [

	methodDefinition
		source: aCompiledMethod sourceCode;
		selector: aCompiledMethod selector;
		methodClassName: aCompiledMethod methodClass name;
		isClassSide: aCompiledMethod methodClass isClassSide.

	codePresenter text: methodDefinition source.
]

{ #category : #accessing }
DaisyMethodPresenter >> selector [
	^ methodDefinition selector
]
