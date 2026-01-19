Class {
	#name : 'UkeLesson',
	#superclass : 'Object',
	#instVars : [
		'name',
		'url'
	],
	#category : 'Ukulele-Core',
	#package : 'Ukulele',
	#tag : 'Core'
}

{ #category : 'examples' }
UkeLesson class >> example [
	<sampleInstance>
	
	^ UkeLesson new
		url: 'https://youtu.be/Ailz-IgzeM4' asUrl;
		yourself.
]

{ #category : 'accessing' }
UkeLesson >> name [
	^ name
]

{ #category : 'accessing' }
UkeLesson >> name: anObject [
	name := anObject
]

{ #category : 'magritte-accessing' }
UkeLesson >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		yourself
]

{ #category : 'viewing' }
UkeLesson >> present [
	^ Smalltalk tools webBrowser new open: self url.
]

{ #category : 'magritte-accessing' }
UkeLesson >> presentDescription [
	<magritteActionDescription>
	^ MAActionDescription new
			action: #present;
			priority: 100;
			yourself
]

{ #category : 'viewing' }
UkeLesson >> printOn: aStream [
	
	aStream
		nextPutAll: 'Lesson: ';
		maPrint: self nameDescription for: self
]

{ #category : 'accessing' }
UkeLesson >> url [
	^ url
]

{ #category : 'accessing' }
UkeLesson >> url: anObject [
	url := anObject
]

{ #category : 'magritte-accessing' }
UkeLesson >> urlDescription [
	<magritteDescription>
	^ MAUrlDescription new
		accessor: #url;
		yourself
]
