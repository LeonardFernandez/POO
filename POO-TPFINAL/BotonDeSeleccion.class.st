Class {
	#name : #BotonDeSeleccion,
	#superclass : #CheckboxMorph,
	#category : #'POO-TPFINAL'
}

{ #category : #'as yet unclassified' }
BotonDeSeleccion class >> crearConNombre: n [
	|seleccion|
	seleccion := self new.
	seleccion label: n asMorph.
	seleccion extent: 100@20.
	^seleccion .
]

{ #category : #'as yet unclassified' }
BotonDeSeleccion >> getSeleccion [
	^ buttonMorph selected.
]
