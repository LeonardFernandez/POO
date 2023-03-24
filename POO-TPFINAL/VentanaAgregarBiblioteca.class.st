Class {
	#name : #VentanaAgregarBiblioteca,
	#superclass : #Ventana,
	#instVars : [
		'biblioteca',
		'inId',
		'inDireccion',
		'inNombre',
		'inTelefono',
		'inRepresentante',
		'colLibro',
		'tituloInId',
		'tituloInDireccion',
		'tituloInNombre',
		'tituloInTelefono',
		'tituloInRepresentante',
		'botConfirmar',
		'botAgregarLibro',
		'inIdLibro',
		'inNombreLibro',
		'inEditorialLibro',
		'inAñoLibro',
		'inAutorLibro',
		'tituloInIdLibro',
		'tituloInNombreLibro',
		'tituloInEditorialLibro',
		'tituloInAñoLibro',
		'tituloInAutorLibro',
		'botAgregarAutor',
		'colAutor',
		'txt',
		'txt2',
		'txtAutor'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #accessing }
VentanaAgregarBiblioteca >> accionRegistroBiblioteca [

	| inputCompleto |
	inputCompleto := inId isEmpty not & inDireccion isEmpty not
	                 & inNombre isEmpty not & inTelefono isEmpty not
	                 & inRepresentante isEmpty not.
	inputCompleto ifTrue: [ 
		biblioteca := Biblioteca
			              crearConId: inId obtenerDato
			              direccion: inDireccion obtenerDato
			              nombre: inNombre obtenerDato
			              telefono: inTelefono obtenerDato
			              nombreRepresentante: inRepresentante obtenerDato
			              colLibro: colLibro.
		sistema agregarBiblioteca: biblioteca ].
	^ inputCompleto
]

{ #category : #'as yet unclassified' }
VentanaAgregarBiblioteca >> accionRegistroLibro: col [

	| inputCompleto libro |
	inputCompleto := inIdLibro isEmpty not & inNombreLibro isEmpty not
	                 & inEditorialLibro isEmpty not
	                 & inAñoLibro isEmpty not & colAutor isNotEmpty.
	inputCompleto ifTrue: [ 
		libro := Libro
			         crearConId: inIdLibro obtenerDato
			         nombre: inNombreLibro obtenerDato
			         editorial: inEditorialLibro obtenerDato
			         año: inAñoLibro obtenerDato
			         colAutor: colAutor.
		col add: libro. ].
	^ inputCompleto
]

{ #category : #initialization }
VentanaAgregarBiblioteca >> establecerElementos [

	| exitoTxtLibro exitoTxtBiblioteca |
	"Datos biblioteca"
	colAutor := OrderedCollection new.
	exitoTxtLibro := StringMorph new.
	exitoTxtBiblioteca := StringMorph new.
	inId := Input crearInput.
	inDireccion := Input crearInput.
	inNombre := Input crearInput.
	inTelefono := Input crearInput.
	inRepresentante := Input crearInput.
	txt := StringMorph new.
	txt2 := StringMorph new.
	txt
		contents:
			'En el lado izquierdo rellenara los datos de la biblioteca, en el lado derecho los datos de los libros que desee agregar en la biblioteca.Podra agregar cuantos libros quiera, rellene los datos necesarios, luego pulse el boton agregar libro.';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 10).
	txt2
		contents:
			'Repita el proceso segun cuanto libros desee agregar. Una vez que ha terminado de rellenar los datos de la biblioteca y los diferentes libros(si lo desea) pulse el boton confirmar para registrar la biblioteca';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 10).
	tituloInId := 'Ingrese id Biblioteca' asMorph.
	tituloInDireccion := 'Ingrese direccion Biblioteca' asMorph.
	tituloInNombre := 'Ingrese nombre Biblioteca' asMorph.
	tituloInTelefono := 'Ingrese telefono Bibliteca' asMorph.
	tituloInRepresentante := 'Ingrese nombre del representante' asMorph.
	botConfirmar := BotonAccion
		                crearConNombre: 'Confirmar'
		                dimension: 200 @ 50
		                color: Color black.
	botAgregarLibro := BotonAccion
		                   crearConNombre: 'Agregar Libro'
		                   dimension: 180 @ 35
		                   color: Color black.
	"Posiciones"
	self addMorphCentered: txt.
	txt top: self top + 100.
	txt2 position: txt position + (0 @ 15).
	self addMorphCentered: botConfirmar.
	botConfirmar top: self top + 600.
	self addMorphCentered: tituloInId.
	tituloInId
		top: self top + 150;
		left: self left + 50.
	inId position: tituloInId position + (0 @ 25).
	tituloInDireccion position: inId position + (0 @ 50).
	inDireccion position: tituloInDireccion position + (0 @ 25).
	tituloInNombre position: inDireccion position + (0 @ 50).
	inNombre position: tituloInNombre position + (0 @ 25).
	tituloInTelefono position: inNombre position + (0 @ 50).
	inTelefono position: tituloInTelefono position + (0 @ 25).
	tituloInRepresentante position: inTelefono position + (0 @ 50).
	inRepresentante position: tituloInRepresentante position + (0 @ 25).
	exitoTxtBiblioteca position: botConfirmar position + (-35 @ 70).

	"Elementos datos libro"
	self establecerElementosLibro.
	"Bot agregar libro posicion"
	botAgregarLibro position: inRepresentante position + (800 @ 50).
	exitoTxtLibro position: botAgregarLibro position + (0 @ 25).

	self addMorph: inId.
	self addMorph: inDireccion.
	self addMorph: inNombre.
	self addMorph: inTelefono.
	self addMorph: inRepresentante.
	self addMorph: tituloInId.
	self addMorph: tituloInDireccion.
	self addMorph: tituloInNombre.
	self addMorph: tituloInTelefono.
	self addMorph: tituloInRepresentante.
	self addMorph: botAgregarLibro.
	self addMorph: txt2.

	"Accion botones"
	colLibro := OrderedCollection new.
	botAgregarLibro mouseAction: [ 
		'termminar accion boton agregar libro, registro de biblioteca(chequeo input)'.
		(self accionRegistroLibro: colLibro)
			ifTrue: [ 
				exitoTxtLibro contents: 'Libro agregado, puede agregar otro'.
				colAutor := OrderedCollection new.
				'Dejamos la colAutor vacia para el proximo libro que se registre' ]
			ifFalse: [ 
			exitoTxtLibro contents: 'Por favor complete todos los campos' ].
		self addMorph: exitoTxtLibro ].
	botConfirmar mouseAction: [ 
		self accionRegistroBiblioteca
			ifTrue: [ 
				exitoTxtBiblioteca contents:
					'Biblioteca registrada con exito, puede cerrar la ventana' ]
			ifFalse: [ 
				exitoTxtBiblioteca contents:
					'Por favor complete todos los campos para registrar la biblioteca' ].
		self addMorph: exitoTxtBiblioteca ]
]

{ #category : #'as yet unclassified' }
VentanaAgregarBiblioteca >> establecerElementosLibro [
	inIdLibro := Input crearInput.
	inNombreLibro := Input crearInput.
	inEditorialLibro := Input crearInput.
	inAñoLibro := Input crearInput.
	inAutorLibro := Input crearInput.
	tituloInIdLibro := 'Ingrese id del libro' asMorph.
	tituloInNombreLibro := 'Ingrese nombre del libro' asMorph.
	tituloInEditorialLibro := 'Ingrese editorial del libro' asMorph.
	tituloInAñoLibro := 'Ingrese el año del libro' asMorph.
	tituloInAutorLibro := 'Ingrese un autor' asMorph.
	botAgregarLibro := BotonAccion
		                   crearConNombre: 'Agregar Libro'
		                   dimension: 180 @ 35
		                   color: Color black.
	botAgregarAutor := BotonAccion
		                   crearConNombre: 'Agregar Autor'
		                   dimension: 150 @ 25
		                   color: Color black.
	txtAutor := StringMorph new.
	txtAutor contents:
		'Si desea agregar otro autor, pulse el boton e ingrese otro'.
	"Posiciones"
	tituloInIdLibro position: tituloInId position + (800 @ 0).
	inIdLibro position: tituloInIdLibro position + (0 @ 25).
	tituloInNombreLibro position: inIdLibro position + (0 @ 50).
	inNombreLibro position: tituloInNombreLibro position + (0 @ 25).
	tituloInEditorialLibro position: inNombreLibro position + (0 @ 50).
	inEditorialLibro position: tituloInEditorialLibro position + (0 @ 25).
	tituloInAñoLibro position: inEditorialLibro position + (0 @ 50).
	inAñoLibro position: tituloInAñoLibro position + (0 @ 25).
	tituloInAutorLibro position: inAñoLibro position + (0 @ 50).
	inAutorLibro position: tituloInAutorLibro position + (0 @ 25).


	"Posicion botones"
	botAgregarAutor position: inAutorLibro position + (180 @ 0).

	"Posicion txt"
	txtAutor position: inAutorLibro position + (0 @ 25).

	"Accion botAgregarAutor"
	botAgregarAutor mouseAction: [ 
		colAutor add: inAutorLibro obtenerDato.
		txtAutor contents: 'Autor agregado, puedo agregar otro si lo desea' ].
	self addMorph: tituloInIdLibro.
	self addMorph: inIdLibro.
	self addMorph: inNombreLibro.
	self addMorph: inEditorialLibro.
	self addMorph: inAñoLibro.
	self addMorph: inAutorLibro.
	self addMorph: tituloInNombreLibro.
	self addMorph: tituloInEditorialLibro.
	self addMorph: tituloInAñoLibro.
	self addMorph: tituloInAutorLibro.
	self addMorph: botAgregarAutor.
	self addMorph: txtAutor
]

{ #category : #initialization }
VentanaAgregarBiblioteca >> initialize [ 
super initialize.
	self crearTitulo: 'Agregar Biblioteca y Material '.
	self establecerElementos
]
