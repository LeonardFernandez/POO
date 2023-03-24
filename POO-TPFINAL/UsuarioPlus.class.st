Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#instVars : [
		'fechaPago',
		'estaAlDia'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus class >> crearNombre: n apellido: a dni: d contraseña: c [
	|usuarioPlus|
	usuarioPlus := self new.
	usuarioPlus iniciarConNombre: n apellido: a dni: d contraseña: c.
	^usuarioPlus .
	
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> cambiarTipoMembresia [

	"Devuelve un usuario con los mismos datos"

	| usuarioM |
	usuarioM := Usuario
		            crearNombre: nombre
		            apellido: apellido
		            dni: dni
		            contraseña: contraseña.
	^ usuarioM
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> cumpleCondiciones [ 
	|cumple|
	cumple := super cumpleCondiciones .
	cumple := cumple & estaAlDia.
	^cumple
]

{ #category : #initialization }
UsuarioPlus >> iniciarConNombre: n apellido: a dni: d contraseña: c [
	super iniciarConNombre: n apellido: a dni: d contraseña: c.
	fechaPago := Date today.
	estaAlDia := true
]

{ #category : #initialization }
UsuarioPlus >> initialize [ 
	fechaPago := Date today.
	estaAlDia := true.
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> permitirAudioLibro [
	^true
]
