Class {
	#name : #VentanaDevolverPrestamo,
	#superclass : #Ventana,
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaDevolverPrestamo >> establecerElementos [

	| inBiblio tituloBiblio inDni tituloDni botBuscarBiblio botConfirmar biblioEncontrada cartel info usuarioEncontrado |
	info := StringMorph new.
	info
		contents:
			'Tenga en cuenta que se devolvera el prestamo mas antiguo que tenga registrado el usuario';
		font: (LogicalFont
				 familyName: StandardFonts defaultFont familyName
				 pointSize: 12).
	inBiblio := Input crearInput.
	inDni := Input crearInput.
	botBuscarBiblio := BotonAccion
		                   crearConNombre: 'Buscar Biblioteca'
		                   dimension: 180 @ 35
		                   color: Color black.
	botConfirmar := BotonAccion
		                crearConNombre: 'Confirmar devolucion'
		                dimension: 180 @ 35
		                color: Color black.
	tituloBiblio := 'Ingrese nombre de la biblioteca' asMorph.
	tituloDni := 'Ingrese D.N.I del usuario' asMorph.
	cartel := StringMorph new.
	self addMorphCentered: info.
	self addMorphCentered: inBiblio.
	self addMorph: tituloBiblio.
	self addMorph: botBuscarBiblio.
	"Posicion elementos"
	info top: self top + 100.
	inBiblio top: self top + 170.
	tituloBiblio position: inBiblio position + (0 @ -25).
	botBuscarBiblio position: inBiblio position + (0 @ 50).
	inDni position: botBuscarBiblio position + (0 @ 75).
	tituloDni position: botBuscarBiblio position + (0 @ 50).
	botConfirmar position: inDni position + (0 @ 30).
	"Accion botones"
	botBuscarBiblio mouseAction: [ 
		(biblioEncontrada := sistema encontrarBiblioteca:
			                     inBiblio obtenerDato)
			ifNotNil: [ 
				cartel contents: 'Biblioteca encontrada'.
				cartel position: botBuscarBiblio position.
				self addMorph: cartel.
				self addMorph: inDni.
				self addMorph: tituloDni.
				self addMorph: botConfirmar.
				self removeMorph: botBuscarBiblio ]
			ifNil: [ 
				cartel contents: 'Biblioteca NO encontrada'.
				cartel position: inBiblio position + (0 @ 25).
				self addMorph: cartel ] ].
	botConfirmar mouseAction: [ 
		(usuarioEncontrado := sistema encontrarUsuario: inDni obtenerDato)
			ifNotNil: [ 
				(biblioEncontrada devolverPrestamo: usuarioEncontrado)
					ifTrue: [ 
						cartel
							contents:
								'Devolucion exitosa.Se ha devuelto el prestamo que primero vence';
							position: botConfirmar position ]
					ifFalse: [ cartel
						contents:
							'El usuario no adeuda prestamo';
						position: botConfirmar position ].
				self removeMorph: botConfirmar ]
			ifNil: [ 
				cartel
					contents: 'Usuario no encontrado, intente nuevamente';
					position: botConfirmar position + (0 @ 30) ] ]
]

{ #category : #initialization }
VentanaDevolverPrestamo >> initialize [ 
	super initialize .
	self crearTitulo: 'Devolucion de Prestamo'.
	self establecerElementos .
]
