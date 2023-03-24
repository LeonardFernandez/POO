Class {
	#name : #VentanaRegistroUsuario,
	#superclass : #Ventana,
	#instVars : [
		'botRegistrar',
		'seleccionPlus',
		'inNombre',
		'inApellido',
		'inDni',
		'inContra',
		'textoExito',
		'textoError'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #'as yet unclassified' }
VentanaRegistroUsuario >> accionRegistro [
	| usuario exito |
	exito := inNombre isEmpty not & inApellido isEmpty not
	         & inDni isEmpty not & inContra isEmpty not.
	exito
		ifTrue: [ 
			(seleccionPlus getSeleccion)
				ifTrue: [ 
					usuario := UsuarioPlus
						           crearNombre: inNombre obtenerDato 
						           apellido: inApellido obtenerDato 
						           dni: inDni obtenerDato 
						           contraseña: inContra obtenerDato ]
				ifFalse: [ 
					usuario := Usuario
						           crearNombre: inNombre obtenerDato 
						           apellido: inApellido obtenerDato 
						           dni: inDni obtenerDato 
						           contraseña: inContra obtenerDato ].
			sistema agregarUsuario: usuario .
		].
	^ exito.
]

{ #category : #initialization }
VentanaRegistroUsuario >> establecerElementos [
	|tituloNombre tituloApellido tituloDni tituloContra |
	"Definimos boton de registro"
	botRegistrar  := BotonAccion crearConNombre: 'Registrar' dimension: 200@50 color: Color black .
	botRegistrar position: 700@500.
	self addMorph: botRegistrar .
	"Texto mostrado en caso de exito o error de registro"
	textoExito := StringMorph new. textoExito  position: botRegistrar position+(0@75).
	textoError := StringMorph new. textoError  position: botRegistrar position+(0@75).
	
	"Accion del boton registrar"
	botRegistrar mouseAction: [(self accionRegistro) 
		ifTrue:[self removeMorph: textoError .textoExito  contents: 'Usuario registrado, puede cerrar la ventana'.self addMorph: textoExito .] 
		ifFalse:[textoError  contents:'Por favor, complete todos los campos'. self addMorph: textoError ]
		].
	"Creamos los input"
	inNombre := Input crearInput .
	inApellido := Input crearInput .
	inDni := Input crearInput .
	inContra := Input crearInput .
	"Boton de seleccion"
	seleccionPlus := BotonDeSeleccion crearConNombre: 'Usuario Plus'.
	"Definimos su posicion"
	inNombre position: 500@500.
	inApellido position: inNombre position+(0@(75)).
	inDni position: inApellido position+(0@(75)).
	inContra position: inDni position+(0@(75)).
	seleccionPlus position: inContra position+(0@(75)).
	self addMorph: inNombre .
	self addMorph: inApellido .
	self addMorph: inDni .
	self addMorph: inContra .
	self addMorph: seleccionPlus .
	"Cartel que indica el tipo de input"
	tituloNombre := 'Ingrese nombre' asMorph .
	tituloApellido := 'Ingrese el apellido' asMorph .
	tituloDni := 'Ingrese el dni' asMorph.
	tituloContra := 'Ingrese la contrasenia' asMorph .
	"Posicion de los carteles"
	tituloNombre position: inNombre position+(0@(-25)).
	tituloApellido position: inApellido position+(0@(-25)).
	tituloDni position: inDni position+(0@(-25)).
	tituloContra position: inContra position+(0@(-25)).
	self addMorph: tituloNombre .
	self addMorph: tituloApellido .
	self addMorph: tituloDni .
	self addMorph: tituloContra .
	
		
]

{ #category : #initialization }
VentanaRegistroUsuario >> initialize [ 
	super initialize .
	self establecerElementos .
	
]
