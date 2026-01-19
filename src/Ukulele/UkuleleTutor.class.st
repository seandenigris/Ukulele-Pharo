Class {
	#name : 'UkuleleTutor',
	#superclass : 'Object',
	#instVars : [
		'songs',
		'tabProviders'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : 'Ukulele-Core',
	#package : 'Ukulele',
	#tag : 'Core'
}

{ #category : 'examples' }
UkuleleTutor class >> exampleAddLesson [
	<sampleInstance>
	| result |
	result := UkuleleTutor exampleInstance.
	result lessons add: UkeLesson example.
	^ result
]

{ #category : 'examples' }
UkuleleTutor class >> exampleAddProvider [
	<sampleInstance>
	| result |
	result := UkuleleTutor exampleInstance.
	result tabProviders add: UkeTabProvider example.
	^ result
]

{ #category : 'examples' }
UkuleleTutor class >> exampleAddSong [
	<sampleInstance>
	| result |
	result := UkuleleTutor exampleInstance.
	result songs add: UkeSong example.
	^ result
]

{ #category : 'examples' }
UkuleleTutor class >> exampleInstance [
	^ self new
]

{ #category : 'instance creation' }
UkuleleTutor class >> instance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : 'instance creation' }
UkuleleTutor class >> open [
	<script>
	^ self instance inspect.
]

{ #category : 'persistence' }
UkuleleTutor class >> restoreFrom: anObject [

	UniqueInstance := anObject.
]

{ #category : 'persistence' }
UkuleleTutor class >> spData [
	^ UniqueInstance
]

{ #category : 'private' }
UkuleleTutor >> ensureTabProviderAt: aUrl [
	^ self tabProviders
			detect: [ :e | e servesURL: aUrl ]
			ifNone: [ 
				self tabProviders add: (UkeTabProvider new url: aUrl; yourself) ]
]

{ #category : 'magritte-rendering' }
UkuleleTutor >> html [
	^ PRHTMLWriter write: self maPillar
]

{ #category : 'accessing' }
UkuleleTutor >> lessons [
	^ self songs flatCollect: #lessons
]

{ #category : 'magritte-descriptions' }
UkuleleTutor >> lessonsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #lessons;
		beReadOnly;
		yourself
]

{ #category : 'magritte-rendering' }
UkuleleTutor >> maPillarRenderer [
	^ super maPillarRenderer
			objectDescription: (self magritteDescription select: [ :e | e label = 'Songs' ]);
			yourself.
]

{ #category : 'accessing' }
UkuleleTutor >> songs [

	^ self maLazyInstVarUsing: self songsDescription
]

{ #category : 'accessing' }
UkuleleTutor >> songs: anObject [
	songs := anObject
]

{ #category : 'magritte-descriptions' }
UkuleleTutor >> songsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #songs;
		classes: { UkeSong };
		default: Bag new;
		yourself
]

{ #category : 'accessing' }
UkuleleTutor >> tabProviders [
	^ self maLazyFrom: self tabProvidersDescription
]

{ #category : 'accessing' }
UkuleleTutor >> tabProviders: anObject [
	tabProviders := anObject
]

{ #category : 'magritte-descriptions' }
UkuleleTutor >> tabProvidersDescription [
	"This is really for documentation because there doesn't currently seem to be a use case for examining providers
	<magritteDescription>"
	^ MAToManyRelationDescription new
		accessor: #tabProviders;
		classes: { UkeTabProvider };
		default: Bag new;
		yourself
]
