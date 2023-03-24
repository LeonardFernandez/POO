Class {
	#name : #VentanaMaterialBiblio,
	#superclass : #Ventana,
	#instVars : [
		'botBuscar',
		'botAgregar',
		'botEliminar',
		'inNombreBiblio',
		'tituloInNombreBilbio',
		'biblioEncontrada'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #'as yet unclassified' }
VentanaMaterialBiblio >> eliminarLibro: biblioteca [

	| inId tituloInId exitoTxt libro |
	exitoTxt := StringMorph new.
	inId := Input crearInput.
	tituloInId := 'Ingrese el id del libro a eliminar' asMorph.
	botEliminar := BotonAccion
		               crearConNombre: 'Eliminar Libro'
		               dimension: 180 @ 35
		               color: Color black.
	self addMorphCentered: tituloInId.
	tituloInId top: self top + 300.
	inId position: tituloInId position + (0 @ 25).
	botEliminar position: inId position + (0 @ 50).
	exitoTxt position: inId position + (0 @ 25).
	"Agregar bot position exitoTxt"
	self addMorph: inId.
	self addMorph: botEliminar.
	botEliminar mouseAction: [ 
		(libro := biblioEncontrada buscarLibro: inId obtenerDato)
			ifNotNil: [ 
				biblioteca removeLibro: libro.
				exitoTxt contents: 'Libro eliminado, puede cerrar la ventana'.
				self addMorph: exitoTxt.
				self removeMorph: botEliminar ]
			ifNil: [ 
				exitoTxt contents: 'Libro no encontrado, intente nuevamente'.
				self addMorph: exitoTxt ] ]
]

{ #category : #initialization }
VentanaMaterialBiblio >> establecerElementos [

	botAgregar := BotonAccion
		              crearConNombre: 'Agregar Material'
		              dimension: 200 @ 50
		              color: Color black.
	botEliminar := BotonAccion
		               crearConNombre: 'Eliminar Material'
		               dimension: 200 @ 50
		               color: Color black.
	"Posiciones"
	self addMorphCentered: botAgregar.
	self addMorph: botEliminar.
	botAgregar top: self top + 300.
	botEliminar position: botAgregar position + (0 @ 75).
	"Accion de los botones"
	botAgregar mouseAction: [ 
		self removeMorph: botAgregar.
		self removeMorph: botEliminar.
		self opcionAgregar ].
	botEliminar mouseAction: [ self removeMorph: botAgregar.
		self removeMorph: botEliminar.
		self opcionEliminar ]
]

{ #category : #initialization }
VentanaMaterialBiblio >> initialize [

	super initialize.
	self crearTitulo: 'Modificar material Biblioteca'.
	self establecerElementos .
]

{ #category : #'as yet unclassified' }
VentanaMaterialBiblio >> opcionAgregar [

	| exitoTxt |
	exitoTxt := StringMorph new.
	botBuscar := BotonAccion
		             crearConNombre: 'Buscar Biblioteca'
		             dimension: 180 @ 35
		             color: Color black.
	inNombreBiblio := Input crearInput.
	tituloInNombreBilbio := 'Ingrese el nombre de la biblioteca' asMorph.
	self addMorphCentered: tituloInNombreBilbio.
	tituloInNombreBilbio top: self top + 200.
	inNombreBiblio position: tituloInNombreBilbio position + (0 @ 25).
	botBuscar position: inNombreBiblio position + (0 @ 50).
	exitoTxt position: inNombreBiblio position + (0 @ 25).

	self addMorph: inNombreBiblio.
	self addMorph: botBuscar.
	botBuscar mouseAction: [ 
		(biblioEncontrada := sistema encontrarBiblioteca:
			                     inNombreBiblio obtenerDato)
			ifNotNil: [ 
				exitoTxt contents: 'Biblioteca encontrada'.
				self removeMorph: botBuscar.
				self addMorph: exitoTxt.
				self registrarLibro: biblioEncontrada . ]
			ifNil: [ 
				exitoTxt contents: 'Biblioteca no encontrada, intente nuevamente'.
				self addMorph: exitoTxt ] ]
]

{ #category : #'as yet unclassified' }
VentanaMaterialBiblio >> opcionEliminar [

	| exitoTxt |
	exitoTxt := StringMorph new.
	botBuscar := BotonAccion
		             crearConNombre: 'Buscar Biblioteca'
		             dimension: 180 @ 35
		             color: Color black.
	inNombreBiblio := Input crearInput.
	tituloInNombreBilbio := 'Ingrese el nombre de la biblioteca' asMorph.
	self addMorphCentered: tituloInNombreBilbio.
	tituloInNombreBilbio top: self top + 200.
	inNombreBiblio position: tituloInNombreBilbio position + (0 @ 25).
	botBuscar position: inNombreBiblio position + (0 @ 50).
	exitoTxt position: inNombreBiblio position + (0 @ 25).

	self addMorph: inNombreBiblio.
	self addMorph: botBuscar.
	botBuscar mouseAction: [ 
		(biblioEncontrada := sistema encontrarBiblioteca:
			                     inNombreBiblio obtenerDato)
			ifNotNil: [ 
				exitoTxt contents: 'Biblioteca encontrada'.
				self removeMorph: botBuscar.
				self addMorph: exitoTxt.
				self eliminarLibro: biblioEncontrada  ]
			ifNil: [ 
				exitoTxt contents: 'Biblioteca no encontrada, intente nuevamente'.
				self addMorph: exitoTxt ] ]
]

{ #category : #'as yet unclassified' }
VentanaMaterialBiblio >> registrarLibro: biblioteca [

	| inId inNombre inEditorial inAño inAutor tituloInId tituloInNombre tituloInEditorial tituloInAño tituloInAutor botAgregarAutor botConfirmar colAutor inputCompleto libro txt txtAutor |
	txt := StringMorph new.
	txtAutor := StringMorph new.
	botAgregarAutor := BotonAccion
		                   crearConNombre: 'Agregar Autor'
		                   dimension: 180 @ 35
		                   color: Color black.
	botConfirmar := BotonAccion
		                crearConNombre: 'Confirmar'
		                dimension: 180 @ 35
		                color: Color black.
	inId := Input crear.
	inNombre := Input crear.
	inEditorial := Input crear.
	inAño := Input crear.
	inAutor := Input crear.
	tituloInId := 'Ingrese ID' asMorph.
	tituloInNombre := 'Ingrese nombre del libro' asMorph.
	tituloInEditorial := 'Ingrese la editorial' asMorph.
	tituloInAño := 'Ingrese año del libro' asMorph.
	tituloInAutor := 'Ingrese un autor, si desea añadir otro puede hacerlo luego de pulsar el boton "Agregar autor"'
		                 asMorph.
	"Posiciones"
	self addMorphCentered: tituloInId.
	tituloInId
		top: self top + 300;
		left: self left + 50.
	tituloInNombre position: tituloInId position + (125 @ 0).
	tituloInEditorial position: tituloInNombre position + (175 @ 0).
	tituloInAño position: tituloInEditorial position + (175 @ 0).
	tituloInAutor position: tituloInEditorial position + (325 @ 0).
	"Posiciones inputs"
	inId position: tituloInId position + (0 @ 35).
	inNombre position: tituloInNombre position + (0 @ 35).
	inEditorial position: tituloInEditorial position + (0 @ 35).
	inAño position: tituloInAño position + (0 @ 35).
	inAutor position: tituloInAutor position + (0 @ 35).
	"Posiciones botones"
	botAgregarAutor position: inAutor position + (0 @ 25).
	self addMorphCentered: botConfirmar.
	botConfirmar top: self top + 500.
	txt position: botConfirmar position + (0 @ 50).
	txtAutor position: botAgregarAutor position + (0 @ 50).

	"Boton para agregar autor"
	colAutor := OrderedCollection new.
	botAgregarAutor mouseAction: [ colAutor add: inAutor obtenerDato. txtAutor contents:'Autor Agregado a la coleccion'. self addMorph: txtAutor  ].

	self addMorph: tituloInNombre.
	self addMorph: tituloInEditorial.
	self addMorph: tituloInAño.
	self addMorph: tituloInAutor.
	self addMorph: inId.
	self addMorph: inNombre.
	self addMorph: inEditorial.
	self addMorph: inAño.
	self addMorph: inAutor.
	self addMorph: botAgregarAutor.

	botConfirmar mouseAction: [ 
		inputCompleto := inId isEmpty not & inNombre isEmpty not
		                 & inEditorial isEmpty not & inAño isEmpty not
		                 & colAutor isNotEmpty.
		inputCompleto
			ifTrue: [ 
				libro := Libro
					         crearConId: inId obtenerDato
					         nombre: inNombre obtenerDato
					         editorial: inEditorial obtenerDato
					         año: inAño obtenerDato
					         colAutor: colAutor.
				biblioteca agregarLibro: libro.
				txt contents: 'Libro agregado con exito, puede cerrar la ventana'.
				self addMorph: botConfirmar ]
			ifFalse: [ txt contents: 'Por favor complete todos los datos' ].
		self addMorph: txt ]
]
