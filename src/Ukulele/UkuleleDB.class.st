Class {
	#name : 'UkuleleDB',
	#superclass : 'SpFileDatabase',
	#category : 'Ukulele-Persistence',
	#package : 'Ukulele',
	#tag : 'Persistence'
}

{ #category : 'accessing' }
UkuleleDB class >> backupDirectoryParent [
	^ FileLocator dynabookData
]

{ #category : 'loading/saving' }
UkuleleDB class >> schema [

	^ { UkuleleTutor }.
]
