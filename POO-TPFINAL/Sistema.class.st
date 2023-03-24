Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'colUsuario',
		'colBiblioteca',
		'colAutor'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Sistema class >> crear [
	|sistema|
	sistema := self new.
	sistema iniciarSistema.
	^sistema 
]

{ #category : #'as yet unclassified' }
Sistema class >> crearConColUsuario: u colBiblioteca: b colAutor: a [
	|sistema|
	sistema := self new.
	sistema iniciarConColUsuario: u colBiblioteca: b colAutor: a.
	^sistema.
]

{ #category : #'as yet unclassified' }
Sistema >> agregarAutor: unAutor [

	colAutor add: unAutor.
	self changed: colAutor .
]

{ #category : #'as yet unclassified' }
Sistema >> agregarBiblioteca: unaBiblio [

	colBiblioteca add: unaBiblio.
	self changed: colBiblioteca .
]

{ #category : #'as yet unclassified' }
Sistema >> agregarUsuario: u [

	colUsuario add: u.
	self changed: colUsuario .
]

{ #category : #'as yet unclassified' }
Sistema >> devolverPrestamosActivos: usuario [
"Devuelve una coleccion la cual contiene los id de todos los prestamos activos del usuario en el sistema"
	| coleccion |
	coleccion := OrderedCollection new.
	colBiblioteca do: [ :biblioteca | 
		coleccion addAll: (biblioteca encontrarPrestamosActivos: usuario) ].
	^ coleccion
]

{ #category : #'as yet unclassified' }
Sistema >> encontrarBiblioteca: nombreBiblio [
	|biblioEncontrada|
	colBiblioteca  do:[:biblio| (biblio esMisma: nombreBiblio )ifTrue:[biblioEncontrada :=biblio ]].
	^biblioEncontrada 
]

{ #category : #'as yet unclassified' }
Sistema >> encontrarUsuario: unDni [
	|usuarioEncontrado|
	colUsuario do:[:usuario| (usuario esMismo: unDni)ifTrue:[usuarioEncontrado :=usuario ]].
	^usuarioEncontrado 
]

{ #category : #initialization }
Sistema >> iniciarConColUsuario: u colBiblioteca: b colAutor: a [
	colUsuario := u.
	colBiblioteca := b.
	colAutor := a.
]

{ #category : #initialization }
Sistema >> iniciarSistema [
	colUsuario := OrderedCollection new.
	colBiblioteca := OrderedCollection new.
	colAutor := OrderedCollection new.
]

{ #category : #initialization }
Sistema >> initialize [ 
	colUsuario := OrderedCollection new.
	colBiblioteca := OrderedCollection new.
	colAutor := OrderedCollection new.
]
