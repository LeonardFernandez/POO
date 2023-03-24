Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Autor class >> crearConNombre: n apellido: a [
	|autor|
	autor := self new.
	autor iniciarConNombre: n apellido:a.
	^autor. 
]

{ #category : #'as yet unclassified' }
Autor >> iniciarConNombre: n apellido: a [
	nombre := n.
	apellido :=a.
]
