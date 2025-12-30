Logical: BloodPressureModel
Parent: Element 
Id: BloodPressureModel
* patient 1..1 Reference(Patient) "Patient" "Subject of procedure." 
* performer 0..1 Reference(Practitioner or PractitionerRole) "Performer" "The people who performed the procedure." 
* performed 1..1 dateTime "Effective time" "When the procedure was performed." 
* position 1..1 Coding "The position of the individual at the time of measurement." ""
* systolic 1..1 Quantity "The actual numeric result of systolic blood pressure." ""
* diastolic 1..1 Quantity "The actual numeric result of diastolic blood pressure." ""
* note 0..1 string "Comments about the observation" "Comments about the observation or the results."

/*
Mapping: category
Id: category
Title: "Observation category binding to HL7 Terminology"
Source: BloodPressureModel
Target: "http://terminology.hl7.org/CodeSystem/observation-category"
* . -> "vital-signs"

Mapping: sct
Id: sct
Title: "Value binding to SNOMED CT"
Source: BloodPressureModel
Target: "http://snomed.info/conceptdomain"
* . -> "75367002 |Blood pressure|" 
* position -> "163033001 |Lying blood pressure| or 163035008 |Sitting blood pressure| or 163034007 |Standing blood pressure reading|"
* systolic -> "271649006 |Systolic blood pressure|" 
* diastolic -> "271650006 |Diastolic blood pressure|"
*/
