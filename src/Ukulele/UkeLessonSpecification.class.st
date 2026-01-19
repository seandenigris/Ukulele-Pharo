Class {
	#name : 'UkeLessonSpecification',
	#superclass : 'TestCase',
	#category : 'Ukulele-Specification',
	#package : 'Ukulele',
	#tag : 'Specification'
}

{ #category : 'accessing' }
UkeLessonSpecification >> testExample [

	| lesson |
	lesson := UkeLesson example.
	self assert: lesson url = 'https://youtu.be/Ailz-IgzeM4' asUrl
]
