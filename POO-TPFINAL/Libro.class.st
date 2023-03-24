Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'id',
		'editorial',
		'año',
		'colAutor',
		'disponible'
	],
	#classInstVars : [
		'id',
		'nombre',
		'editorial',
		'año',
		'colAutores'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Libro class >> crearConId:i nombre:n editorial:e año:a colAutor:c [
	|libro|
	libro:=self new.
	libro iniciarConId: i nombre:n  editorial:e  año:a  colAutor:c.
	^libro. 
]

{ #category : #'as yet unclassified' }
Libro >> esAudioLibro [
	^false.
]

{ #category : #'as yet unclassified' }
Libro >> esMismo: unId [
	^id=unId .
]

{ #category : #'as yet unclassified' }
Libro >> estaDisponible [
	^disponible .
]

{ #category : #'as yet unclassified' }
Libro >> iniciarConId: i nombre: n editorial: e año: a colAutor: c [

	id := i.
	nombre := n.
	editorial := e.
	año := a.
	colAutor := c.
	disponible := true.
]

{ #category : #'as yet unclassified' }
Libro >> marcarDisponible [
	disponible := true.
]

{ #category : #initialization }
Libro >> setDisponible: disp [
	disponible := disp.
]
