Class {
	#name : 'UkeSong',
	#superclass : 'Object',
	#instVars : [
		'name',
		'author',
		'lessons',
		'original',
		'tabs'
	],
	#category : 'Ukulele-Core',
	#package : 'Ukulele',
	#tag : 'Core'
}

{ #category : 'examples' }
UkeSong class >> example [
	<sampleInstance>
	^ UkeSong new
		name: 'I''m Yours';
		author: 'Jason Mraz';
		yourself.
]

{ #category : 'accessing' }
UkeSong >> author [
	^ author
]

{ #category : 'accessing' }
UkeSong >> author: anObject [
	author := anObject
]

{ #category : 'magritte-accessing' }
UkeSong >> authorDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #author;
		priority: 200;
		yourself
]

{ #category : 'accessing' }
UkeSong >> lessons [
	^ lessons ifNil: [ lessons := OrderedCollection new ]
]

{ #category : 'accessing' }
UkeSong >> lessons: anObject [
	lessons := anObject
]

{ #category : 'magritte-accessing' }
UkeSong >> lessonsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #lessons;
		priority: 400;
		classes: { UkeLesson };
		yourself
]

{ #category : 'accessing' }
UkeSong >> name [
	^ name
]

{ #category : 'accessing' }
UkeSong >> name: anObject [
	name := anObject
]

{ #category : 'magritte-accessing' }
UkeSong >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		priority: 100;
		yourself
]

{ #category : 'accessing' }
UkeSong >> original [
	^ original
]

{ #category : 'accessing' }
UkeSong >> original: anObject [
	original := anObject
]

{ #category : 'magritte-accessing' }
UkeSong >> originalDescription [
	<magritteDescription>
	^ MAUrlDescription new
		accessor: #original;
		priority: 300;
		yourself
]

{ #category : 'accessing' }
UkeSong >> playOriginal [
	^ Smalltalk tools webBrowser openOn: original.
]

{ #category : 'accessing' }
UkeSong >> playOriginalDescription [
	<magritteActionDescription>
	^ MAActionDescription new
			action: #playOriginal;
			priority: 200;
			yourself
]

{ #category : 'printing' }
UkeSong >> printOn: aStream [
	
	aStream
		nextPut: $";
		maPrint: self nameDescription for: self;
		nextPutAll: '" by ';
		maPrint: self authorDescription for: self
]

{ #category : 'accessing' }
UkeSong >> tabs [
	^ tabs
]

{ #category : 'accessing' }
UkeSong >> tabs: anObject [
	tabs := anObject
]

{ #category : 'magritte-accessing' }
UkeSong >> tabsDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #tabs;
		classes: (Set new add: UkeTabs; yourself);
		priority: 500;
		yourself
]

{ #category : 'accessing' }
UkeSong >> viewDashboard [
	self playOriginal.
	self tabs present.
	self lessons first present
]

{ #category : 'accessing' }
UkeSong >> viewDashboardDescription [
	<magritteActionDescription>
	^ MAActionDescription new
			action: #viewDashboard;
			priority: 100;
			yourself
]
