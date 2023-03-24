Class {
	#name : #VentanaPrincipal,
	#superclass : #Ventana,
	#instVars : [
		'botRegistrarUsuario',
		'botSolicitarPrestamo',
		'botDevolverPrestamo',
		'botCambiarMembresia',
		'botInfoUsuario',
		'botInfoBiblioteca',
		'botAgregarBiblio',
		'botMaterialBiblio',
		'ventanaRegistroUsuario',
		'ventanaSolicitarPrestamo',
		'ventanaCambiarMembresia',
		'ventanaDevolverPrestamo',
		'ventanaInfoUsuario',
		'ventanaInfoBiblioteca',
		'ventanaMaterialBiblio',
		'ventanaAgregarBiblio'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #initialization }
VentanaPrincipal >> initialize [

	super initialize.
	self crearTitulo: 'SISTEMA GESTOR DE BIBLIOTECAS'.
	botRegistrarUsuario := BotonAccion
		                       crearConNombre: 'Registrar Usuario'
		                       dimension: 200 @ 50
		                       color: Color black.
	botSolicitarPrestamo := BotonAccion
		                        crearConNombre: 'Solicitar Prestamo'
		                        dimension: 200 @ 50
		                        color: Color black.
	botDevolverPrestamo := BotonAccion
		                       crearConNombre: 'Devolver Prestamo'
		                       dimension: 200 @ 50
		                       color: Color black.
	botCambiarMembresia := BotonAccion
		                       crearConNombre: 'Cambiar Membresia'
		                       dimension: 200 @ 50
		                       color: Color black.
	botInfoUsuario := BotonAccion
		                  crearConNombre: 'Informacion Usuarios'
		                  dimension: 200 @ 50
		                  color: Color black.
	botInfoBiblioteca := BotonAccion
		                     crearConNombre: 'Informacion Bibliotecas'
		                     dimension: 200 @ 50
		                     color: Color black.
	botAgregarBiblio := BotonAccion
		                    crearConNombre:
		                    'Agregar Biblioteca y material disp.'
		                    dimension: 200 @ 50
		                    color: Color black.
	botMaterialBiblio := BotonAccion
		                     crearConNombre: 'Modificar material Biblioteca'
		                     dimension: 200 @ 50
		                     color: Color black.
	self addMorph: botRegistrarUsuario.
	self addMorph: botSolicitarPrestamo.
	self addMorph: botDevolverPrestamo.
	self addMorph: botCambiarMembresia.
	self addMorph: botInfoUsuario.
	self addMorph: botInfoBiblioteca.
	self addMorph: botAgregarBiblio.
	self addMorph: botMaterialBiblio.
	botRegistrarUsuario position: self position + (510 @ 150).
	botSolicitarPrestamo position:
		botRegistrarUsuario position + (0 @ 75).
	botDevolverPrestamo position:
		botSolicitarPrestamo position + (0 @ 75).
	botCambiarMembresia position: botDevolverPrestamo position + (0 @ 75).
	botInfoUsuario position: botCambiarMembresia position + (0 @ 75).
	botInfoBiblioteca position: botInfoUsuario position + (0 @ 75).
	botAgregarBiblio position: botInfoBiblioteca position + (0 @ 75).
	botMaterialBiblio position: botAgregarBiblio position + (0 @ 75).
	botRegistrarUsuario mouseAction: [ 
		ventanaRegistroUsuario := VentanaRegistroUsuario crearConSistema:
			                          sistema ].
	botSolicitarPrestamo mouseAction: [ 
		ventanaSolicitarPrestamo := VentanaSolicitarPrestamo 
			                            crearConSistema: sistema ].
	botCambiarMembresia mouseAction: [ 
		ventanaCambiarMembresia := VentanaCambioMembresia crearConSistema:
			                           sistema ].
	botDevolverPrestamo mouseAction: [ 
		ventanaDevolverPrestamo := VentanaDevolverPrestamo crearConSistema:
			                           sistema ].
	botInfoUsuario mouseAction: [ 
		ventanaInfoUsuario := VentanaInfoUsuario crearConSistema: sistema ].
	botInfoBiblioteca mouseAction: [ 
		ventanaInfoBiblioteca := VentanaInfoBiblioteca crearConSistema: sistema ].
	botMaterialBiblio mouseAction: [ 
		ventanaMaterialBiblio := VentanaMaterialBiblio crearConSistema:
			                         sistema ].
	botAgregarBiblio mouseAction: [ ventanaAgregarBiblio := VentanaAgregarBiblioteca crearConSistema: sistema  ]
]
