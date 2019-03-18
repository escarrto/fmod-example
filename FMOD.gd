extends Node

var FMOD = setFMOD.new()

func _ready():
	
	FMOD.setBanksPath("./FMOD/Audio/")
	
	FMOD.setSystem()
	FMOD.setLowLevelSystem()
	FMOD.setSoftwareFormat()
	FMOD.setInitialize()
	FMOD.setMasterBank()
	FMOD.setStringBank()
	FMOD.setBanks("Ambience.bank, UI_Menu.bank")
	FMOD.createEventDescription("event:/Birds", "Birds")
	FMOD.createEventDescription("event:/UI/cancel", "Cancel")
	FMOD.createEventDescription("event:/Ambience/Hour", "Hour")
	FMOD.createEventInstance("Hour")
	FMOD.setParameterValue("Hour", "Time", 13.0)
	FMOD.start("Hour")
		
func _unhandled_input(event):
	
	if event is InputEventKey:
		
		if event.pressed and event.scancode == KEY_ESCAPE:
			
			pass
				
		elif event.pressed and event.scancode == KEY_Z:
			FMOD.createEventInstance("Cancel")
			FMOD.start("Cancel")
			FMOD.release("Cancel")
			
	#FMOD.release("Hour")		
	#FMOD.setSystemUpdate()
	#FMOD.unsetBanks()
	#FMOD.unsetStringsBank()
	#FMOD.unsetMasterBank()
	#FMOD.setSystemRelease()

var time = 13.0
func _process(delta):

	time += delta * 0.6
	
	FMOD.setParameterValue("Hour", "Time", time)
	FMOD.setSystemUpdate()
	
	if time >= 24.0:
		time = 0
		delta = 0


				
		

			
			




