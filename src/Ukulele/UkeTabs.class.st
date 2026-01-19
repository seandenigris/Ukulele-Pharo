Class {
	#name : 'UkeTabs',
	#superclass : 'Object',
	#instVars : [
		'url',
		'hasFloatingChords',
		'areChangesPinpointed',
		'isTransposable'
	],
	#category : 'Ukulele-Core',
	#package : 'Ukulele',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
UkeTabs class >> exampleCreating [
	^ UkeTabs new
			url: 'https://www.ukulele-tabs.com/uke-songs/uke-songs/jason-mraz/im-yours-uke-tab-11804.html' asUrl;
			areChangesPinpointed: false;
			hasFloatingChords: true;
			isTransposable: true;
			yourself
]

{ #category : 'accessing' }
UkeTabs >> areChangesPinpointed [
	^ areChangesPinpointed
]

{ #category : 'accessing' }
UkeTabs >> areChangesPinpointed: anObject [
	areChangesPinpointed := anObject
]

{ #category : 'magritte-accessing' }
UkeTabs >> areChangesPinpointedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #areChangesPinpointed;
		priority: 400;
		yourself
]

{ #category : 'private' }
UkeTabs >> defaultProvider [
	self url ifNil: [ ^ nil ].
	^ UkuleleTutor instance tabProviders
			detect: [ :e | e servesURL: self url ]
			ifNone: [ UkuleleTutor instance ensureTabProviderAt: self url ]
]

{ #category : 'accessing' }
UkeTabs >> hasFloatingChords [
	^ self provider
		ifNotNil: [ :p | p hasFloatingChords ]
		ifNil: [ hasFloatingChords ]
]

{ #category : 'accessing' }
UkeTabs >> hasFloatingChords: anObject [
	hasFloatingChords := anObject.
	self updateTabProvider: [ :tp | tp hasFloatingChords: hasFloatingChords ].
]

{ #category : 'magritte-accessing' }
UkeTabs >> hasFloatingChordsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #hasFloatingChords;
		default: (self provider ifNotNil: [ :tp | hasFloatingChords ]);
		priority: 300;
		yourself
]

{ #category : 'accessing' }
UkeTabs >> isTransposable [
	^ self provider
		ifNotNil: [ :p | p isTransposable ]
		ifNil: [ isTransposable ]
]

{ #category : 'accessing' }
UkeTabs >> isTransposable: aBoolean [
	isTransposable := aBoolean.
	self updateTabProvider: [ :tp | tp isTransposable: isTransposable ].
]

{ #category : 'magritte-accessing' }
UkeTabs >> isTransposableDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #isTransposable;
		default: (self provider ifNotNil: [ :tp | isTransposable ]);
		priority: 200;
		yourself
]

{ #category : 'viewing' }
UkeTabs >> present [
	^ Smalltalk tools webBrowser openOn: self url.
]

{ #category : 'viewing' }
UkeTabs >> presentDescription [
	<magritteActionDescription>
	^ MAActionDescription new
			action: #present;
			priority: 100;
			yourself
]

{ #category : 'printing' }
UkeTabs >> printOn: aStream [
	
	aStream
		nextPutAll: 'Tabs: ';
		maPrint: self urlDescription for: self
]

{ #category : 'private' }
UkeTabs >> provider [
	^ self defaultProvider
]

{ #category : 'magritte-accessing' }
UkeTabs >> providerDescription [
	"<magritteDescription>"
	^ MAToOneRelationDescription new
		accessor: #provider;
		beReadOnly;
		priority: 500;
		classes:
			(Set new
				add: UkeTabProvider;
				yourself);
		default: self defaultProvider;
		yourself
]

{ #category : 'private' }
UkeTabs >> updateTabProvider: aBlock [

	self provider ifNotNil: [ :p | aBlock value: p ]
]

{ #category : 'accessing' }
UkeTabs >> url [
	^ url
]

{ #category : 'accessing' }
UkeTabs >> url: aUrl [
	url := aUrl.
	self updateTabProvider: [ :e | ]
]

{ #category : 'magritte-accessing' }
UkeTabs >> urlDescription [
	<magritteDescription>
	^ MAUrlDescription new
		accessor: #url;
		priority: 100;
		yourself
]
