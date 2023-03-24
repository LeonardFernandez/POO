Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'id',
		'direccion',
		'nombre',
		'telefono',
		'nombreRepresentante',
		'colLibro',
		'colPrestamo',
		'diasPrestamo',
		'diasSuspension'
	],
	#classInstVars : [
		'nombre',
		'id',
		'direccion',
		'telefono',
		'nombreRepresentante',
		'colLibro'
	],
	#category : #'POO-TPFINAL-Modelo'
}

{ #category : #'as yet unclassified' }
Biblioteca class >> crearConId: unId direccion: unaDire nombre: unNombre telefono: unTelefono nombreRepresentante: unRepre [

	| biblio |
	biblio := self new.
	biblio iniciarConId: unId direccion: unaDire nombre: unNombre telefono: unTelefono nombreRepresentante: unRepre .
	^ biblio
]

{ #category : #'as yet unclassified' }
Biblioteca class >> crearConId: unId direccion: unaDire nombre: unNombre telefono: unTelefono nombreRepresentante: unRepre
 colLibro: unaCol [
	| biblio |
	biblio := self new.
	biblio
		iniciarConId: unId
		direccion: unaDire
		nombre: unNombre
		telefono: unTelefono
		nombreRepresentante: unRepre.
	^ biblio
]

{ #category : #'as yet unclassified' }
Biblioteca class >> crearConNombre: n [
	|biblio|
	biblio := self new.
	biblio iniciarConNombreBiblioteca: n.
	^biblio.
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarLibro: unLibro [

	colLibro add: unLibro.
	self changed: colLibro .
]

{ #category : #'as yet unclassified' }
Biblioteca >> agregarPrestamo: unPrestamo [

	colPrestamo add: unPrestamo.
	self changed: colPrestamo .
]

{ #category : #'as yet unclassified' }
Biblioteca >> buscarLibro: idLibro [
"Ete metodo busca un libro especifico dentro de la colLibros, devuelve el libro en caso de que exista y se encuentre disponible"
	| libroEncontrado |
	colLibro do: [ :libro | 
		(libro esMismo: idLibro) ifTrue: [ 
			libro estaDisponible ifTrue: [ libroEncontrado := libro ] ] ].
	^ libroEncontrado
]

{ #category : #'as yet unclassified' }
Biblioteca >> devolverPrestamo: unUsuario [

	| exito prestamoMasAntiguo |
	exito := false.
	prestamoMasAntiguo := self encontrarPrestamoPendiente: unUsuario.
	prestamoMasAntiguo ifNotNil: [ 
		prestamoMasAntiguo marcarEntregado: diasSuspension. exito := true ].
	
^exito
]

{ #category : #'as yet unclassified' }
Biblioteca >> encontrarPrestamoPendiente: unUsuario [

	| prestamoMasAntiguo |
	prestamoMasAntiguo := nil.
	colPrestamo do: [ :prestamo | 
		(prestamo perteneceUsuario: unUsuario) ifTrue: [ 
			prestamo estaPendiente ifTrue: [ 
				prestamoMasAntiguo := prestamo devolverMasAntiguo:
					                      prestamoMasAntiguo ] ] ].
		^prestamoMasAntiguo 
]

{ #category : #'as yet unclassified' }
Biblioteca >> encontrarPrestamosActivos: usuario [

	| coleccion |
	"Devuelve una coleccion la cual contiene los id de los prestamos activos del usuario"
	coleccion := OrderedCollection new.
	colPrestamo do: [ :prestamo | 
		((prestamo perteneceUsuario: usuario) & (prestamo estaPendiente) ) ifTrue: [ 
			coleccion add: prestamo getId ] ].
	^ coleccion
]

{ #category : #'as yet unclassified' }
Biblioteca >> esMisma: nombreBiblio [
	^nombre = nombreBiblio .
]

{ #category : #'as yet unclassified' }
Biblioteca >> getDireccion [

	^ direccion 
]

{ #category : #'as yet unclassified' }
Biblioteca >> getId [
	^id
]

{ #category : #'as yet unclassified' }
Biblioteca >> getNombre [ 
	^nombre 
]

{ #category : #'as yet unclassified' }
Biblioteca >> getNombreRepresentante [
	^nombreRepresentante 
]

{ #category : #'as yet unclassified' }
Biblioteca >> getPrestamosActivos [

	| coleccion |
	"Devuelve una coleccion la cual contiene los id de los prestamos activos del usuario"
	coleccion := OrderedCollection new.
	colPrestamo do: [ :prestamo | 
		(prestamo estaPendiente) ifTrue: [ 
			coleccion add: prestamo getId ] ].
	^ coleccion
]

{ #category : #'as yet unclassified' }
Biblioteca >> getTelefono [
^telefono 
]

{ #category : #'as yet unclassified' }
Biblioteca >> iniciarConId: unId direccion: unaDire nombre: unNombre telefono: unTelefono nombreRepresentante: unRepre [
	nombre := unNombre .
	id:=unId .
	direccion := unaDire .
	telefono := unTelefono .
	nombreRepresentante := unRepre .
	colLibro := OrderedCollection new.
	colPrestamo := OrderedCollection new
	
]

{ #category : #'as yet unclassified' }
Biblioteca >> iniciarConId: unId direccion: unaDire nombre: unNombre telefono: unTelefono nombreRepresentante: unRepre colLibro: unaCol [

	nombre := unNombre.
	id := unId.
	direccion := unaDire.
	telefono := unTelefono.
	nombreRepresentante := unRepre.
	colLibro := unaCol.
	colPrestamo := OrderedCollection new.
	diasSuspension := 7.
]

{ #category : #'as yet unclassified' }
Biblioteca >> iniciarConNombreBiblioteca: n [
	nombre := n.
	colLibro := OrderedCollection new.
	colPrestamo := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Biblioteca >> prestamoPendiente: unUsuario [

	| debePrestamo |
	debePrestamo := false.
	debePrestamo := colPrestamo anySatisfy: [ :prestamo | 
		                (prestamo perteneceUsuario:
			                unUsuario) & (prestamo estaPendiente) ].
	^ debePrestamo
]

{ #category : #'as yet unclassified' }
Biblioteca >> registrarPrestamoConUsuario: unUsuario yColLibro: unaCol [

	| apto colLibroP colAudioLibro permitirAl prestamoA prestamoB |
	apto := self verificarCondiciones: unUsuario.
	apto ifTrue: [ 
		colLibro := OrderedCollection new.
		colAudioLibro := OrderedCollection new.
		unaCol do: [ :libro | 
			libro esAudioLibro
				ifTrue: [ colAudioLibro add: libro ]
				ifFalse: [ colLibroP add: libro ] ].
		permitirAl := unUsuario permitirAudioLibro.
		(colLibroP isNotNil) ifTrue: [ 
			prestamoA := Prestamo
				             crearConColLibro: colLibroP
				             usuario: unUsuario
				             diasPrestamo: diasPrestamo ].
		(colAudioLibro isNotNil & permitirAl) ifTrue: [ 
			prestamoB := Prestamo
				             crearConColLibro: colAudioLibro
				             usuario: unUsuario
				             diasPrestamo: diasPrestamo ] ].
	^ apto
]

{ #category : #removing }
Biblioteca >> removeLibro: unLibro [
	colLibro remove: unLibro .
]

{ #category : #'as yet unclassified' }
Biblioteca >> verificarCondiciones: unUsuario [
	|debePrestamo cumple apto|
	debePrestamo := self prestamoPendiente: unUsuario .
	cumple := unUsuario cumpleCondiciones .
	apto := (debePrestamo not) & cumple .
	^ apto.
]
