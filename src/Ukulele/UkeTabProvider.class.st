Class {
	#name : 'UkeTabProvider',
	#superclass : 'Object',
	#instVars : [
		'url',
		'hasFloatingChords',
		'isTransposable'
	],
	#category : 'Ukulele-Core',
	#package : 'Ukulele',
	#tag : 'Core'
}

{ #category : 'example' }
UkeTabProvider class >> example [
	<sampleInstance>
	^ UkeTabProvider new
		url: 'https://www.ukulele-tabs.com' asUrl;
		hasFloatingChords: true;
		isTransposable: true;
		yourself
]

{ #category : 'accessing' }
UkeTabProvider >> hasFloatingChords [
	^ self maLazyFrom: self hasFloatingChordsDescription
]

{ #category : 'accessing' }
UkeTabProvider >> hasFloatingChords: anObject [
	hasFloatingChords := anObject
]

{ #category : 'magritte-accessing' }
UkeTabProvider >> hasFloatingChordsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #hasFloatingChords;
		yourself
]

{ #category : 'accessing' }
UkeTabProvider >> isTransposable [
	^ self maLazyFrom: self isTransposableDescription
]

{ #category : 'accessing' }
UkeTabProvider >> isTransposable: anObject [
	isTransposable := anObject
]

{ #category : 'magritte-accessing' }
UkeTabProvider >> isTransposableDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #isTransposable;
		yourself
]

{ #category : 'printing' }
UkeTabProvider >> printOn: aStream [
	aStream
		nextPutAll: 'Tabs at ';
		print: url
]

{ #category : 'as yet unclassified' }
UkeTabProvider >> servesURL: aUrl [ 
	^ self url host = aUrl host
]

{ #category : 'accessing' }
UkeTabProvider >> url [
	^ self maLazyFrom: self urlDescription
]

{ #category : 'accessing' }
UkeTabProvider >> url: aUrl [
	url := aUrl copy clearPath; queryRemoveAll
]

{ #category : 'magritte-accessing' }
UkeTabProvider >> urlDescription [
	<magritteDescription>
	^ MAUrlDescription new
		accessor: #url;
		yourself
]
