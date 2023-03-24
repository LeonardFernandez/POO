Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloqueAccion'
	],
	#category : #'POO-TPFINAL'
}

{ #category : #'as yet unclassified' }
BotonAccion class >> crearConNombre: unNom dimension: unaDim color: unCol [
	|boton|
	boton :=self new.
	boton iniciarConNombre: unNom dimension: unaDim color: unCol .
	^boton 
]

{ #category : #'as yet unclassified' }
BotonAccion >> iniciarConNombre: unNom dimension: unaDim color: unCol [
	self label: unNom.
	self extent: unaDim .
	self color: unCol .
]

{ #category : #'as yet unclassified' }
BotonAccion >> mouseAction: aBlock [
"Se guarda en la variable bloqueAccion el bloque recibido por parámetro, indica que acción se ejecutará cuando haya una acción sobre el mouse."
	^bloqueAccion := aBlock .
]

{ #category : #'event handling' }
BotonAccion >> mouseUp: unEvento [
"Este método se ejecuta cuando se produce un evento, como un click sobre el mouse y su
liberación. Como mouseAction mantiene un bloque, se le envia el mensaje value para que se
ejecuten las acciones indicadas en el bloque."
bloqueAccion value.
]
