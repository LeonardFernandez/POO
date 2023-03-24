Class {
	#name : #VentanaInfoUsuario,
	#superclass : #Ventana,
	#instVars : [
		'botBuscar',
		'nombre',
		'apellido',
		'dni',
		'tituloNombre',
		'tituloApellido',
		'tituloDni',
		'tituloPrestamos',
		'usuarioEncontrado'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaInfoUsuario >> establecerElementos [

	| tituloInDni inDni exito |
	botBuscar := BotonAccion
		             crearConNombre: 'Ver info usuario'
		             dimension: 180 @ 35
		             color: Color black.
	inDni := Input crearInput.
	tituloInDni := 'Ingrese el dni del usuario' asMorph.
	exito := StringMorph new.

	"Posiciones"

	self addMorphCentered: inDni.
	self addMorphCentered: tituloInDni.

	inDni top: self top + 180.
	tituloInDni top: self top + 155.
	botBuscar position: inDni position + (0 @ 35).
	exito position: botBuscar position + (-50 @ 35).
	self addMorph: tituloInDni.
	self addMorph: botBuscar.

	botBuscar mouseAction: [ 
		(usuarioEncontrado := sistema encontrarUsuario: inDni obtenerDato)
			ifNotNil: [ 
				exito contents:
					'Usuario encontrado, a continuacion se detalla su informacion'.
				self addMorph: exito.
				self mostrarInformacion: usuarioEncontrado ]
			ifNil: [ 
				exito contents: 'Usuario no encontrado, intente nuevamente'.
				self addMorph: exito ] ]
]

{ #category : #initialization }
VentanaInfoUsuario >> initialize [

	super initialize.
	self crearTitulo: 'Informacion de usuario'.
	self establecerElementos.
	
]

{ #category : #'as yet unclassified' }
VentanaInfoUsuario >> mostrarInformacion: usuario [

	sistema addDependent: self.
	nombre := StringMorph new.
	apellido := StringMorph new.
	dni := StringMorph new.
	tituloNombre := StringMorph new.
	tituloApellido := StringMorph new.
	tituloDni := StringMorph new.
	tituloPrestamos := StringMorph new.
	tituloNombre
		contents: 'Nombre';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloApellido
		contents: 'Apellido';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloDni
		contents: 'D.N.I';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
	tituloPrestamos
		contents: 'Prestamos Activos';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 15).
				
	"Posiciones"
	tituloNombre
		top: self top + 275;
		left: self left + 50.
	tituloApellido position: tituloNombre position + (100 @ 0).
	tituloDni position: tituloApellido position + (100 @ 0).
	tituloPrestamos position: tituloDni position + (100 @ 0).
	nombre position: tituloNombre position + (0 @ 35).
	apellido position: tituloApellido position + (0 @ 35).
	dni position: tituloDni position + (0 @ 35).
	self addMorph: tituloNombre.
	self addMorph: tituloApellido.
	self addMorph: tituloDni.
	self addMorph: tituloPrestamos.
	self addMorph: nombre.
	self addMorph: apellido.
	self addMorph: dni.

	self update.
	
]

{ #category : #'as yet unclassified' }
VentanaInfoUsuario >> mostrarTabla: coleccion [

	| objetoMorph posicion|
	posicion := '' asMorph.
	posicion position: 150 @ 150.
	coleccion do: [ :objeto | 
		objetoMorph := objeto asMorph.
		objetoMorph position: posicion position + (0 @ 20).
		posicion position: posicion position + (0 @ 20).
		self addMorph: objetoMorph ]
]

{ #category : #'as yet unclassified' }
VentanaInfoUsuario >> mostrarTabla: coleccion posicion: posicionIndicada [
"Muestra una tabla dada una coleccion y una posicion"
	| objetoMorph posicion |
	posicion := '' asMorph.
	posicion position: posicionIndicada.
	coleccion do: [ :objeto | 
		objetoMorph := objeto asMorph.
		objetoMorph position: posicion position + (0 @ 20).
		posicion position: posicion position + (0 @ 20).
		self addMorph: objetoMorph ]
]

{ #category : #updating }
VentanaInfoUsuario >> update [
	nombre contents: usuarioEncontrado getNombre .
	apellido contents: usuarioEncontrado getApellido .
	dni contents: usuarioEncontrado getDni.
	self
		mostrarTabla: (sistema devolverPrestamosActivos: usuarioEncontrado)
		posicion: tituloPrestamos position + (0 @ 15)
	
	
]
