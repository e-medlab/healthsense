Profile:        HsFamilyMemberHistory
Parent:         FamilyMemberHistory
Id:             hs-family-member-history
Title:          "Family Member History"
Description:    "Perekondlik anamnees"
* patient MS
* status MS 
* relationship MS
* condition MS 
* condition ^short = "Varasemad diagnoosid"
  * code MS
  * code ^short = "Haigus RHK10 või SNOMED kodeeringus"
  * outcome MS  
  * outcome ^short = "Haiguse lõpe tunnus"
  * onset[x] MS 
  * onset[x] ^short = "Millal diagnoositi? (Aasta)"

Instance: FmhOfHernia
InstanceOf: HsFamilyMemberHistory
Title:          "Family history of hernia"
Description:    "Family history of hernia"
Usage: #example
* status = #completed
* patient = Reference(Patient/pat1) 
* relationship = http://snomed.info/sct#72705000 "Mother"
* deceasedBoolean = false
* condition.code = http://snomed.info/sct#39839004 "Diaphragmatic hernia"

Instance: FmhOfDiabetes
InstanceOf: HsFamilyMemberHistory
Title:          "Family history of diabetes"
Description:    "Family history of diabetes"
Usage: #example
* status = #completed
* patient = Reference(Patient/pat1) 
* relationship = SNOMED#38048003 "Uncle"
* deceasedBoolean = false
* condition.code = SNOMED#430678008 "Family history of diabetes mellitus type 1"
