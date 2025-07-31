Class {
	#name : 'LOCell',
	#superclass : 'Morph',
	#instVars : [
		'actionBlock',
		'state'
	],
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'accessing' }
LOCell >> action: aBlock [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	actionBlock := aBlock 

]

{ #category : 'initialization' }
LOCell >> initialize [
	super initialize.
	self borderWidth: 2.
	self borderColor: Color black .
	self position: 0 @ 0 .
	self extent: 16@16 .
	state := false.
	self updateColor.
	self on: #mouseUp send: #toggleState to: self.
]

{ #category : 'switching' }
LOCell >> toggleState [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	state := state not.
	self updateColor .
	actionBlock ifNotNil: [ actionBlock value: state ].
]

{ #category : 'switching' }
LOCell >> turnOff [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	self lastState: false
]

{ #category : 'switching' }
LOCell >> turnOn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	self lastState: true
]

{ #category : 'initialization' }
LOCell >> updateColor [ 
	state 
		ifTrue: [ self color: Color paleYellow ]
		ifFalse: [ self color: Color paleBlue darker ].
]

{ #category : 'initialization' }
LOCell >> updateColor: 
	self [ state 
		ifTrue: [ self color: Color paleYellow ]
		ifFalse: [ self color: Color paleBlue darker ].
]
