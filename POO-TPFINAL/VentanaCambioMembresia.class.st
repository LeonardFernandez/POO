Class {
	#name : #VentanaCambioMembresia,
	#superclass : #Ventana,
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaCambioMembresia >> establecerElementos [

	| usuarioEncontrado inDni inContra botBuscarUsuario botConfirmar textoDni textoContra texto |
	inDni := Input crearInput.
	inContra := Input crearInput.
	botBuscarUsuario := BotonAccion
		                    crearConNombre: 'Buscar usuario'
		                    dimension: 180 @ 35
		                    color: Color black.
	botConfirmar := BotonAccion
		                crearConNombre: 'Confirmar cambio'
		                dimension: 180 @ 35
		                color: Color black.
	textoDni := 'Ingrese D.N.I del usuario' asMorph.
	textoContra := 'Ingrese contraseña del usuario ' asMorph.
	self addMorphCentered: inDni.
	inDni top: self top + 170.

	textoDni position: inDni position + (0 @ -25).
	botBuscarUsuario position: inDni position + (0 @ 75).
	inContra position: botBuscarUsuario position + (0 @ 75).
	textoContra position: inContra position + (0 @ -25).
	botConfirmar position: inContra position + (0 @ 75).
	self addMorph: textoDni.
	self addMorph: botBuscarUsuario.
	texto := StringMorph new.
	botBuscarUsuario mouseAction: [ 
		(usuarioEncontrado := sistema encontrarUsuario: inDni obtenerDato)
			ifNotNil: [ 
				texto contents: 'Usuario encontrado'.
				texto position: botBuscarUsuario position.
				self addMorph: inContra.
				self addMorph: textoContra.
				self addMorph: botConfirmar.
				self removeMorph: botBuscarUsuario.
				self addMorph: texto ]
			ifNil: [ 
				texto contents: 'Usuario no encontrado, intente nuevamente'.
				texto position: inDni position + (0 @ 25).
				self addMorph: texto ] ].
	botConfirmar mouseAction: [ 
		(usuarioEncontrado verificarContraseña: inContra obtenerDato)
			ifTrue: [ 
				usuarioEncontrado := usuarioEncontrado cambiarTipoMembresia.
				texto contents: 'Cambio de membresia exitoso'.
				texto position: botConfirmar position.
				self removeMorph: botConfirmar.
				self addMorph: texto ]
			ifFalse: [ 
				texto contents: 'Contraseña incorrecta, intente nuevamente'.
				texto position: botConfirmar position + (0 @ 75) ] ]
]

{ #category : #initialization }
VentanaCambioMembresia >> initialize [
	super initialize .
	self crearTitulo: 'Solicitud cambio de membresia'.
	self establecerElementos .
]
