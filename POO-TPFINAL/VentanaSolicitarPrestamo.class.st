Class {
	#name : #VentanaSolicitarPrestamo,
	#superclass : #Ventana,
	#instVars : [
		'bot'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaSolicitarPrestamo >> establecerElementos [

	| inDni inContra tituloDni tituloContra botBuscar cartel usuarioEncontrado |
	cartel := StringMorph new.
	inDni := Input crearInput.
	inContra := Input crearInput.
	botBuscar := BotonAccion
		             crearConNombre: 'Buscar'
		             dimension: 150 @ 35
		             color: Color black.
	tituloDni := 'Ingrese DNI del usuario solicitante' asMorph.
	tituloContra := 'Ingrese contraseña del usuario' asMorph.
	inDni position: 500 / 2 @ 300 / 2.
	inContra position: inDni position + (0 @ 75).
	tituloDni position: inDni position + (0 @ -25).
	tituloContra position: inContra position + (0 @ -25).
	botBuscar position: inContra position + (0 @ 50).

	self addMorph: inDni.
	self addMorph: tituloDni.
	self addMorph: botBuscar.
	botBuscar mouseAction: [ 
		(usuarioEncontrado := sistema encontrarUsuario: inDni obtenerDato)
			ifNotNil: [ 
				cartel contents: 'Usuario encontrado'.
				cartel position: botBuscar position.
				self addMorph: cartel.
				self removeMorph: botBuscar.
				self mostrarBusquedaBiblioteca: usuarioEncontrado ]
			ifNil: [ 
				cartel contents: 'Usuario no encontrado'.
				cartel position: botBuscar position + (0 @ 50).
				self addMorph: cartel ] ]
]

{ #category : #initialization }
VentanaSolicitarPrestamo >> initialize [ 
	super initialize .
	self crearTitulo: 'Solicitud Prestamo'.
	self establecerElementos .
]

{ #category : #'as yet unclassified' }
VentanaSolicitarPrestamo >> mostrarBusquedaBiblioteca [
	|inNombre tituloNombre botBuscarBiblio cartel biblioEncontrada|
	cartel := StringMorph new.
	inNombre := Input crearInput .
	inNombre position: 500/2@550/1.5.
	tituloNombre := 'Ingrese nombre de la biblioteca' asMorph .
	tituloNombre position: inNombre position+(0@(-25)).
	botBuscarBiblio := BotonAccion crearConNombre: 'Buscar' dimension: 150@35 color: Color black .
	botBuscarBiblio position: inNombre position+(0@50).
	self addMorph: inNombre .
	self addMorph: tituloNombre .
	self addMorph: botBuscarBiblio .
	botBuscarBiblio mouseAction: [ (biblioEncontrada := sistema encontrarBiblioteca: inNombre obtenerDato)ifNotNil:[cartel contents: 'Biblioteca encontrada'. cartel position: botBuscarBiblio position.self removeMorph: botBuscarBiblio . self addMorph: cartel. self mostrarBusquedaLibro:biblioEncontrada .] ifNil: [cartel contents: 'Biblioteca NO encontrada'. cartel position: botBuscarBiblio position+(0@50).  self addMorph: cartel.]  ]
]

{ #category : #'as yet unclassified' }
VentanaSolicitarPrestamo >> mostrarBusquedaBiblioteca: usuario [
	|inNombre tituloNombre botBuscarBiblio cartel biblioEncontrada|
	cartel := StringMorph new.
	inNombre := Input crearInput .
	inNombre position: 500/2@550/1.5.
	tituloNombre := 'Ingrese nombre de la biblioteca' asMorph .
	tituloNombre position: inNombre position+(0@(-25)).
	botBuscarBiblio := BotonAccion crearConNombre: 'Buscar' dimension: 150@35 color: Color black .
	botBuscarBiblio position: inNombre position+(0@50).
	self addMorph: inNombre .
	self addMorph: tituloNombre .
	self addMorph: botBuscarBiblio .
	botBuscarBiblio mouseAction: [ (biblioEncontrada := sistema encontrarBiblioteca: inNombre obtenerDato)ifNotNil:[cartel contents: 'Biblioteca encontrada'. cartel position: botBuscarBiblio position.self removeMorph: botBuscarBiblio . self addMorph: cartel. self mostrarBusquedaLibro: biblioEncontrada usuario: usuario .] ifNil: [cartel contents: 'Biblioteca NO encontrada'. cartel position: botBuscarBiblio position+(0@50).  self addMorph: cartel.]  ]
]

{ #category : #'as yet unclassified' }
VentanaSolicitarPrestamo >> mostrarBusquedaLibro [
	|inId tituloId botBuscarLibro|
	inId := Input crearInput .
	inId position: 1000@300.
	tituloId := 'Ingrese id del Libro' asMorph .
	tituloId position: inId position+(0@(-25)).
	botBuscarLibro := BotonAccion crearConNombre: 'Buscar' dimension: 150@35 color: Color black .
	botBuscarLibro position: inId position+(0@50).
	self addMorph: inId .
	self addMorph: tituloId .
	self addMorph: botBuscarLibro.
]

{ #category : #'as yet unclassified' }
VentanaSolicitarPrestamo >> mostrarBusquedaLibro: unaBiblio [
	|inId1 inId2 inId3 inId4 inId5 tituloId1 tituloId2 tituloId3 tituloId4 tituloId5 botConfirmar cartelConfirmacion botBuscarLibro1 botBuscarLibro2 botBuscarLibro3 botBuscarLibro4 botBuscarLibro5 cartel1 cartel2 cartel3 cartel4 cartel5 colLibro libro1 libro2 libro3 libro4 libro5|
	cartelConfirmacion := StringMorph new.
	botConfirmar := BotonAccion crearConNombre: 'Confirmar prestamo' dimension: 150@35 color: Color black .
	inId1 := Input crearInput .
	inId1 position: 1000/2@300/1.5.
	inId2 := Input crearInput .
	inId2 position: inId1 position+(0@75).
	inId3 := Input crearInput .
	inId3 position: inId2 position+(0@75).
	inId4 := Input crearInput .
	inId4 position: inId3 position+(0@75).
	inId5 := Input crearInput .
	inId5 position: inId4 position+(0@75).
	tituloId1 := 'Ingrese id del Libro1' asMorph .
	tituloId1 position: inId1 position+(0@(-25)).
	tituloId2 := 'Ingrese id del Libro2' asMorph .
	tituloId2 position: inId2 position+(0@(-25)).
	tituloId3 := 'Ingrese id del Libro3' asMorph .
	tituloId3 position: inId3 position+(0@(-25)).
	tituloId4 := 'Ingrese id del Libro4' asMorph .
	tituloId4 position: inId4 position+(0@(-25)).
	tituloId5 := 'Ingrese id del Libro5' asMorph .
	tituloId5 position: inId5 position+(0@(-25)).
	botBuscarLibro1 := BotonAccion crearConNombre: 'Buscar' dimension: 150@30 color: Color black .
	botBuscarLibro1 position: inId1 position+(185@0).
	botBuscarLibro2 := BotonAccion crearConNombre: 'Buscar' dimension: 150@30 color: Color black .
	botBuscarLibro2 position: inId2 position+(185@0).
	botBuscarLibro3 := BotonAccion crearConNombre: 'Buscar' dimension: 150@30 color: Color black .
	botBuscarLibro3 position: inId3 position+(185@0).
	botBuscarLibro4 := BotonAccion crearConNombre: 'Buscar' dimension: 150@30 color: Color black .
	botBuscarLibro4 position: inId4 position+(185@0).
	botBuscarLibro5 := BotonAccion crearConNombre: 'Buscar' dimension: 150@30 color: Color black .
	botBuscarLibro5 position: inId5 position+(185@0).
	botConfirmar position: inId5 position+(0@80).
	self addMorph: inId1 .
	self addMorph: inId2 .
	self addMorph: inId3 .
	self addMorph: inId4 .
	self addMorph: inId5 .
	self addMorph: tituloId1 .
	self addMorph: tituloId2 .
	self addMorph: tituloId3 .
	self addMorph: tituloId4 .
	self addMorph: tituloId5 .
	self addMorph: botBuscarLibro1 .
	self addMorph: botBuscarLibro2 .
	self addMorph: botBuscarLibro3 .
	self addMorph: botBuscarLibro4 .
	self addMorph: botBuscarLibro5 .
	self addMorph: botConfirmar .
	colLibro := OrderedCollection new.
	cartel1:=StringMorph new.
	botBuscarLibro1 mouseAction: [(libro1 := unaBiblio buscarLibro: inId1 obtenerDato) ifNotNil: [self removeMorph: cartel1. colLibro add: libro1. cartel1 contents:'Libro encontrado'. cartel1 position: botBuscarLibro1 position+(185@0).self addMorph: cartel1] ifNil: [self removeMorph: cartel1. cartel1 contents:'Libro NO encontrado, intente de nuevo'. cartel1 position: botBuscarLibro1 position+(185@0).self addMorph: cartel1] ].
	cartel2:=StringMorph new.
	botBuscarLibro2 mouseAction: [(libro2 := unaBiblio buscarLibro: inId2 obtenerDato) ifNotNil: [self removeMorph: cartel2. colLibro add: libro2. cartel2 contents:'Libro encontrado'. cartel2 position: botBuscarLibro2 position+(185@0).self addMorph: cartel2] ifNil: [self removeMorph: cartel2. cartel2 contents:'Libro NO encontrado, intente de nuevo'. cartel2 position: botBuscarLibro2 position+(185@0).self addMorph: cartel2] ].
	cartel3:=StringMorph new.
	botBuscarLibro3 mouseAction: [(libro3 := unaBiblio buscarLibro: inId3 obtenerDato) ifNotNil: [self removeMorph: cartel3. colLibro add: libro3. cartel3 contents:'Libro encontrado'. cartel3 position: botBuscarLibro3 position+(185@0).self addMorph: cartel3] ifNil: [self removeMorph: cartel3. cartel3 contents:'Libro NO encontrado, intente de nuevo'. cartel3 position: botBuscarLibro3 position+(185@0).self addMorph: cartel3] ].
	cartel4:=StringMorph new.
	botBuscarLibro4 mouseAction: [(libro4 := unaBiblio buscarLibro: inId4 obtenerDato) ifNotNil: [self removeMorph: cartel4. colLibro add: libro4. cartel4 contents:'Libro encontrado'. cartel4 position: botBuscarLibro4 position+(185@0).self addMorph: cartel4] ifNil: [self removeMorph: cartel4. cartel4 contents:'Libro NO encontrado, intente de nuevo'. cartel4 position: botBuscarLibro4 position+(185@0).self addMorph: cartel4] ].
	cartel5:=StringMorph new.
	botBuscarLibro5 mouseAction: [(libro5 := unaBiblio buscarLibro: inId5 obtenerDato) ifNotNil: [self removeMorph: cartel5. colLibro add: libro5. cartel5 contents:'Libro encontrado'. cartel5 position: botBuscarLibro5 position+(185@0).self addMorph: cartel5] ifNil: [self removeMorph: cartel5. cartel5 contents:'Libro NO encontrado, intente de nuevo'. cartel5 position: botBuscarLibro5 position+(185@0).self addMorph: cartel5] ].
	'botBuscarLibro mouseAction: [ (unaBiblio buscarLibro: inId obtenerDato)ifNotNil:[cartel contents: ''Libro disponible. Prestamo realizado con exito, puede cerrar la ventana''. cartel position: botBuscarLibro position. self removeMorph: botBuscarLibro . self addMorph: cartel. exito:=true.]ifNil:[cartel contents:''Libro no encontrado''. cartel position: botBuscarLibro position+(0@50). self addMorph: cartel.] ].
	exito ifTrue:[prestamo:=Prestamo new. prestamo ]'
]

{ #category : #'as yet unclassified' }
VentanaSolicitarPrestamo >> mostrarBusquedaLibro: unaBiblio usuario: unUsuario [

	| inId1 inId2 inId3 inId4 inId5 tituloId1 tituloId2 tituloId3 tituloId4 tituloId5 botConfirmar cartelConfirmacion botBuscarLibro1 botBuscarLibro2 botBuscarLibro3 botBuscarLibro4 botBuscarLibro5 cartel1 cartel2 cartel3 cartel4 cartel5 colLibro libro1 libro2 libro3 libro4 libro5 exito |
	cartelConfirmacion := StringMorph new.
	botConfirmar := BotonAccion
		                crearConNombre: 'Confirmar prestamo'
		                dimension: 150 @ 35
		                color: Color black.
	inId1 := Input crearInput.
	inId1 position: 1000 / 2 @ 300 / 1.5.
	inId2 := Input crearInput.
	inId2 position: inId1 position + (0 @ 75).
	inId3 := Input crearInput.
	inId3 position: inId2 position + (0 @ 75).
	inId4 := Input crearInput.
	inId4 position: inId3 position + (0 @ 75).
	inId5 := Input crearInput.
	inId5 position: inId4 position + (0 @ 75).
	tituloId1 := 'Ingrese id del Libro1' asMorph.
	tituloId1 position: inId1 position + (0 @ -25).
	tituloId2 := 'Ingrese id del Libro2' asMorph.
	tituloId2 position: inId2 position + (0 @ -25).
	tituloId3 := 'Ingrese id del Libro3' asMorph.
	tituloId3 position: inId3 position + (0 @ -25).
	tituloId4 := 'Ingrese id del Libro4' asMorph.
	tituloId4 position: inId4 position + (0 @ -25).
	tituloId5 := 'Ingrese id del Libro5' asMorph.
	tituloId5 position: inId5 position + (0 @ -25).
	botBuscarLibro1 := BotonAccion
		                   crearConNombre: 'Buscar'
		                   dimension: 150 @ 30
		                   color: Color black.
	botBuscarLibro1 position: inId1 position + (185 @ 0).
	botBuscarLibro2 := BotonAccion
		                   crearConNombre: 'Buscar'
		                   dimension: 150 @ 30
		                   color: Color black.
	botBuscarLibro2 position: inId2 position + (185 @ 0).
	botBuscarLibro3 := BotonAccion
		                   crearConNombre: 'Buscar'
		                   dimension: 150 @ 30
		                   color: Color black.
	botBuscarLibro3 position: inId3 position + (185 @ 0).
	botBuscarLibro4 := BotonAccion
		                   crearConNombre: 'Buscar'
		                   dimension: 150 @ 30
		                   color: Color black.
	botBuscarLibro4 position: inId4 position + (185 @ 0).
	botBuscarLibro5 := BotonAccion
		                   crearConNombre: 'Buscar'
		                   dimension: 150 @ 30
		                   color: Color black.
	botBuscarLibro5 position: inId5 position + (185 @ 0).
	botConfirmar position: inId5 position + (0 @ 80).
	self addMorph: inId1.
	self addMorph: inId2.
	self addMorph: inId3.
	self addMorph: inId4.
	self addMorph: inId5.
	self addMorph: tituloId1.
	self addMorph: tituloId2.
	self addMorph: tituloId3.
	self addMorph: tituloId4.
	self addMorph: tituloId5.
	self addMorph: botBuscarLibro1.
	self addMorph: botBuscarLibro2.
	self addMorph: botBuscarLibro3.
	self addMorph: botBuscarLibro4.
	self addMorph: botBuscarLibro5.
	self addMorph: botConfirmar.
	"Se crea la coleccion donde se incluiran los libros solicitados"
	colLibro := OrderedCollection new.
	cartel1 := StringMorph new.
	botBuscarLibro1 mouseAction: [ 
		(libro1 := unaBiblio buscarLibro: inId1 obtenerDato)
			ifNotNil: [ 
				self removeMorph: cartel1.
				colLibro add: libro1.
				cartel1 contents: 'Libro encontrado'.
				cartel1 position: botBuscarLibro1 position + (185 @ 0).
				self addMorph: cartel1 ]
			ifNil: [ 
				self removeMorph: cartel1.
				cartel1 contents: 'Libro NO encontrado, intente de nuevo'.
				cartel1 position: botBuscarLibro1 position + (185 @ 0).
				self addMorph: cartel1 ] ].
	cartel2 := StringMorph new.
	botBuscarLibro2 mouseAction: [ 
		(libro2 := unaBiblio buscarLibro: inId2 obtenerDato)
			ifNotNil: [ 
				self removeMorph: cartel2.
				colLibro add: libro2.
				cartel2 contents: 'Libro encontrado'.
				cartel2 position: botBuscarLibro2 position + (185 @ 0).
				self addMorph: cartel2 ]
			ifNil: [ 
				self removeMorph: cartel2.
				cartel2 contents: 'Libro NO encontrado, intente de nuevo'.
				cartel2 position: botBuscarLibro2 position + (185 @ 0).
				self addMorph: cartel2 ] ].
	cartel3 := StringMorph new.
	botBuscarLibro3 mouseAction: [ 
		(libro3 := unaBiblio buscarLibro: inId3 obtenerDato)
			ifNotNil: [ 
				self removeMorph: cartel3.
				colLibro add: libro3.
				cartel3 contents: 'Libro encontrado'.
				cartel3 position: botBuscarLibro3 position + (185 @ 0).
				self addMorph: cartel3 ]
			ifNil: [ 
				self removeMorph: cartel3.
				cartel3 contents: 'Libro NO encontrado, intente de nuevo'.
				cartel3 position: botBuscarLibro3 position + (185 @ 0).
				self addMorph: cartel3 ] ].
	cartel4 := StringMorph new.
	botBuscarLibro4 mouseAction: [ 
		(libro4 := unaBiblio buscarLibro: inId4 obtenerDato)
			ifNotNil: [ 
				self removeMorph: cartel4.
				colLibro add: libro4.
				cartel4 contents: 'Libro encontrado'.
				cartel4 position: botBuscarLibro4 position + (185 @ 0).
				self addMorph: cartel4 ]
			ifNil: [ 
				self removeMorph: cartel4.
				cartel4 contents: 'Libro NO encontrado, intente de nuevo'.
				cartel4 position: botBuscarLibro4 position + (185 @ 0).
				self addMorph: cartel4 ] ].
	cartel5 := StringMorph new.
	botBuscarLibro5 mouseAction: [ 
		(libro5 := unaBiblio buscarLibro: inId5 obtenerDato)
			ifNotNil: [ 
				self removeMorph: cartel5.
				colLibro add: libro5.
				cartel5 contents: 'Libro encontrado'.
				cartel5 position: botBuscarLibro5 position + (185 @ 0).
				self addMorph: cartel5 ]
			ifNil: [ 
				self removeMorph: cartel5.
				cartel5 contents: 'Libro NO encontrado, intente de nuevo'.
				cartel5 position: botBuscarLibro5 position + (185 @ 0).
				self addMorph: cartel5 ] ].
	botConfirmar mouseAction: [ 
		exito := unaBiblio
			         registrarPrestamoConUsuario: unUsuario
			         yColLibro: colLibro.
		exito
			ifTrue: [ 
				cartelConfirmacion := 'Prestamo realizado con exito, puede cerrar la ventana. Tenga en cuenta que si tiene membresia gratuita no se incluiran audio libros en el prestamo'
					                      asMorph.
				cartelConfirmacion position: botConfirmar position.
				self addMorph: cartelConfirmacion ]
			ifFalse: [ 
				cartelConfirmacion := 'El prestamo no pudo concretarse, el usuario tiene prestamos pendientes o no ha pagado su membresia'
					                      asMorph.
				cartelConfirmacion position: botConfirmar position.
				self addMorph: cartelConfirmacion ].
		nil ifTrue: [  ] ]
]
