Class {
	#name : #Input,
	#superclass : #RubTextFieldMorph,
	#category : #'POO-TPFINAL'
}

{ #category : #'as yet unclassified' }
Input class >> crear [

	| r |
	r := self new.
	r extent: 100 @ 100.
	r borderWidth: 2.
	r borderColor: Color white.
	^ r
]

{ #category : #'as yet unclassified' }
Input class >> crearInput [
	|r|
	r := self new.
	r extent: 175@100.
	r borderWidth: 2.
	r borderColor: Color white.
	^r.
]

{ #category : #accessing }
Input >> input [
	^self text asString.
]

{ #category : #testing }
Input >> isEmpty [
	^ self text asString = ''.
]

{ #category : #'as yet unclassified' }
Input >> obtenerDato [
	^self text asString.
]
