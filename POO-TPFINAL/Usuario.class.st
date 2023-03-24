Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'contraseña',
		'diasSuspension',
		'colBiblioInteres'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Usuario class >> crearNombre: n apellido: a dni: d contraseña: c [
	|usuario|
	usuario := self new.
	usuario iniciarConNombre: n apellido: a dni: d contraseña: c.
	^usuario 
]

{ #category : #'as yet unclassified' }
Usuario >> cambiarTipoMembresia [
"Devuelve un usuarioPlus con los mismos datos"
	|usuarioM|
	usuarioM := UsuarioPlus crearNombre: nombre apellido: apellido dni:dni  contraseña:contraseña .
	^usuarioM 
]

{ #category : #'as yet unclassified' }
Usuario >> cumpleCondiciones [

	| cumple |
	cumple := true.
	cumple := self estaSuspendido not.
	^cumple.
]

{ #category : #'as yet unclassified' }
Usuario >> esMismo: unDni [
	^dni=unDni .
]

{ #category : #'as yet unclassified' }
Usuario >> estaSuspendido [
	|suspendido|
	suspendido := diasSuspension >0.
	^suspendido .
]

{ #category : #'as yet unclassified' }
Usuario >> getApellido [
^apellido .
]

{ #category : #'as yet unclassified' }
Usuario >> getDni [
^dni.
]

{ #category : #'as yet unclassified' }
Usuario >> getNombre [
^nombre .
]

{ #category : #'as yet unclassified' }
Usuario >> iniciarConNombre: n apellido: a dni: d contraseña: c [
	nombre:=n.
	apellido:=a.
	dni:=d.
	contraseña:=c.
]

{ #category : #'as yet unclassified' }
Usuario >> permitirAudioLibro [

	^ false
]

{ #category : #'as yet unclassified' }
Usuario >> suspender: inDiasSuspension [ 
	diasSuspension:=inDiasSuspension  
]

{ #category : #'as yet unclassified' }
Usuario >> verificarContraseña:unaContra [
	^unaContra = contraseña .
]
