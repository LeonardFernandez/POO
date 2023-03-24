Class {
	#name : #VentanaInfoBiblioteca,
	#superclass : #Ventana,
	#instVars : [
		'botBuscar',
		'id',
		'direccion',
		'nombre',
		'telefono',
		'nombreRepresentante',
		'bibliotecaEncontrada',
		'tituloId',
		'tituloNombre',
		'tituloDireccion',
		'tituloTelefeno',
		'tituloRepresentante',
		'tituloPrestamo'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaInfoBiblioteca >> establecerElementos [

	| tituloInNombre inNombre exito |
	
	botBuscar := BotonAccion
		             crearConNombre: 'Ver info biblioteca'
		             dimension: 180 @ 35
		             color: Color black.
	inNombre := Input crearInput.
	tituloInNombre := 'Ingrese el nombre de la biblioteca' asMorph.
	exito := StringMorph new.
	"Posiciones"
	self addMorphCentered: inNombre.
	self addMorphCentered: tituloInNombre.

	inNombre top: self top + 180.
	tituloInNombre top: self top + 155.
	botBuscar position: inNombre position + (0 @ 35).
	exito position: botBuscar position + (-50 @ 35).
	self addMorph: tituloInNombre.
	self addMorph: botBuscar.

	botBuscar mouseAction: [ 
		(bibliotecaEncontrada := sistema encontrarBiblioteca:
			                         inNombre obtenerDato)
			ifNotNil: [ 
				exito contents:
					'Biblioteca encontrada, a continuacion se detalla su informacion'.
				self addMorph: exito.
				self mostrarInformacion. ]
			ifNil: [ 
				exito contents: 'Biblioteca no encontrada, intente nuevamente'.
				self addMorph: exito ] ]
]

{ #category : #initialization }
VentanaInfoBiblioteca >> initialize [

	super initialize.
	
	self crearTitulo: 'Informacion Biblioteca'.
	self establecerElementos .
	
]

{ #category : #'as yet unclassified' }
VentanaInfoBiblioteca >> mostrarInformacion [
	sistema addDependent: self.
	nombre := StringMorph new.
	id := StringMorph new.
	direccion := StringMorph new.
	telefono := StringMorph new.
	nombreRepresentante := StringMorph new.
	tituloNombre := StringMorph new.
	tituloId := StringMorph new.
	tituloDireccion := StringMorph new.
	tituloTelefeno := StringMorph new.
	tituloRepresentante := StringMorph new.
	tituloPrestamo := StringMorph new.
	tituloNombre
		contents: 'Nombre';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloId
		contents: 'Id';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloDireccion
		contents: 'Direccion';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloTelefeno
		contents: 'Telefono';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloRepresentante
		contents: 'Representante';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloPrestamo
		contents: 'Prestamos activos';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	"Posiciones"
	tituloNombre
		top: self top + 275;
		left: self left + 50.
	tituloId position: tituloNombre position + (100 @ 0).
	tituloDireccion position: tituloId position + (100 @ 0).
	tituloTelefeno position: tituloDireccion position + (100 @ 0).
	tituloRepresentante position: tituloTelefeno position + (100 @ 0).
	tituloPrestamo position: tituloRepresentante position + (100 @ 0).
	nombre position: tituloNombre position + (0 @ 35).
	id position: tituloId position + (0 @ 35).
	telefono position: tituloTelefeno position + (0 @ 35).
	direccion position: tituloDireccion position + (0 @ 35).
	nombreRepresentante position: tituloRepresentante position + (0 @ 35).
	self addMorph: tituloNombre.
	self addMorph: tituloId.
	self addMorph: tituloDireccion.
	self addMorph: tituloTelefeno.
	self addMorph: tituloRepresentante.
	self addMorphCentered: tituloPrestamo.
	self addMorph: nombre.
	self addMorph: nombreRepresentante.
	self addMorph: telefono.
	self addMorph: id.
	self addMorph: direccion.
	self update: bibliotecaEncontrada .
]

{ #category : #updating }
VentanaInfoBiblioteca >> update: biblio [
	id contents: biblio getId.
	direccion contents: biblio getDireccion .
	nombre contents: biblio getNombre .
	telefono contents: biblio getTelefono .
	nombreRepresentante contents: biblio getNombreRepresentante .
	self mostrarTabla: bibliotecaEncontrada getPrestamosActivos posicion: tituloPrestamo position+(0@15).
]
