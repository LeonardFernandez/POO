Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'id',
		'fecha',
		'fechaEntrega',
		'usuario',
		'colLibro',
		'diasPrestamo'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Prestamo class >> crearConColLibro: unaCol id: unId usuario: unUsuario diasPrestamo: dias [

	| prestamo |
	prestamo := self new.
	prestamo
		iniciarConColLibro: unaCol
		id: unId
		usuario: unUsuario
		diasPrestamo: dias.
	^ prestamo
]

{ #category : #'as yet unclassified' }
Prestamo >> devolverMasAntiguo: prestamoMasAntiguo [

	| masAntiguo |
	prestamoMasAntiguo isNil
		ifTrue: [ masAntiguo := self ]
		ifFalse: [ 
			(fecha addDays: diasPrestamo < prestamoMasAntiguo getFecha)
				ifTrue: [ masAntiguo := self ]
				ifFalse: [ masAntiguo := prestamoMasAntiguo  ] ].
			^masAntiguo 
]

{ #category : #'as yet unclassified' }
Prestamo >> estaPendiente [

	| debePrestamo |
	debePrestamo := fechaEntrega isNil .
	^ debePrestamo
]

{ #category : #'as yet unclassified' }
Prestamo >> getFecha [
	^fecha
]

{ #category : #'as yet unclassified' }
Prestamo >> getId [
	^id
]

{ #category : #'as yet unclassified' }
Prestamo >> iniciarConColLibro: unaCol id: unId usuario: unUsuario diasPrestamo: dias [

	colLibro := unaCol.
	id:=unId .
	usuario := unUsuario.
	diasPrestamo := dias.
	fechaEntrega := nil
]

{ #category : #'as yet unclassified' }
Prestamo >> marcarEntregado: diasSuspension [

	| atrasado |
	atrasado := false.
	fechaEntrega := Date today.
	atrasado := (fechaEntrega) > (Date today addDays: diasPrestamo).
	colLibro do: [ :libro | libro marcarDisponible ].
	atrasado ifTrue: [ usuario suspender: diasSuspension ]
]

{ #category : #'as yet unclassified' }
Prestamo >> perteneceUsuario: unUsuario [
	|esMismo|
	esMismo := unUsuario = usuario .
	^esMismo .
]
