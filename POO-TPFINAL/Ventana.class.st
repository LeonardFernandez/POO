Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'botCerrar',
		'sistema'
	],
	#category : #'POO-TPFINAL-Vista'
}

{ #category : #'as yet unclassified' }
Ventana class >> crearConSistema: unSis [
	|interfaz|
	interfaz := self new.
	interfaz setSistema: unSis .
	^interfaz .
]

{ #category : #'as yet unclassified' }
Ventana >> cerrar [
"minimiza la ventana"
self delete.
]

{ #category : #'as yet unclassified' }
Ventana >> crearTitulo: elTitulo [
	|titulo|
	titulo := StringMorph new.
	titulo contents: elTitulo  ;font: (LogicalFont familyName: StandardFonts defaultFont familyName pointSize: 30).
	self addMorphCentered: titulo .
	titulo top: self top+35 .
	self addMorph: titulo.
]

{ #category : #'as yet unclassified' }
Ventana >> establecerFondo [
	|background|
	background :=(Form fromFileNamed: 'D:\Descargas\wallpaperbetter.com_1280x768.jpg') asMorph.
	self extent: background  extent .
	self addMorphBack: background .
]

{ #category : #initialization }
Ventana >> initialize [ 
	"comment stating purpose of instance-side method"
	super initialize .
	self establecerFondo .
	self color: Color darkGray. 
	self position: 45@45.
	self bounds: (self position extent: 1280@768).
	"Botones"
	botCerrar := BotonAccion crearConNombre: 'X' dimension: 50@50 color: Color black.
	self addMorph: botCerrar .
	
	botCerrar position: self position+(1230@0).
	
	botCerrar mouseAction: [self cerrar].
	self openCenteredInWorld .
]

{ #category : #'as yet unclassified' }
Ventana >> mostrarTabla: coleccion posicion: posicionIndicada [

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

{ #category : #initialization }
Ventana >> setSistema: s [
	sistema :=s.
]
