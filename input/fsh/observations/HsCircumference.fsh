Alias: $headcircum = http://hl7.org/fhir/StructureDefinition/headcircum

Profile: HsObservationCircumHead
Parent: $headcircum
Id: hs-observation-circumference-head
Title: "Vital Signs - Circumference of Head"
Description: "Pea ümbermõõt"
* ^status = #active
* status obeys inv-hs-obs-vitalsign-status-01
* code.coding MS
* code.coding contains snomed-code 1..1 MS
* code.coding[snomed-code].system 1..
* code.coding[snomed-code].system = SNOMED (exactly)
* code.coding[snomed-code].code 1..
* code.coding[snomed-code].code = #363812007 (exactly)
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
//* method MS
//* method from HsVitalSignMethodVS
//* method ^short = "Väärtus 1156040003 tähendab patsiendi teostatud mõõtmist"
* value[x] only Quantity 
* valueQuantity 1..
* valueQuantity = UCUM#cm "cm"
//* valueQuantity.value obeys inv-hs-obs-vitalsign-valueQuantity-value-01


Profile: HsObservationCircumNeck
Parent: HsObservation
Id: hs-observation-circumference-neck
Title: "Vital Signs - Circumference of Neck"
Description: "Kaela ümbermõõt"
* ^status = #active
* status obeys inv-hs-obs-vitalsign-status-01
* category = OBSCAT#vital-signs "Vital Signs"
* code = SNOMED#420236003 (exactly)
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
//* method MS
//* method from HsVitalSignMethodVS
//* method ^short = "Väärtus 1156040003 tähendab patsiendi teostatud mõõtmist"
* value[x] only Quantity 
* valueQuantity 1..
* valueQuantity = UCUM#cm "cm"



Profile: HsObservationCircumHip
Parent: HsObservation
Id: hs-observation-circumference-hip
Title: "Vital Signs - Circumference of Hip"
Description: "Puusa ümbermõõt"
* ^status = #active
* category = OBSCAT#vital-signs "Vital Signs"
* status obeys inv-hs-obs-vitalsign-status-01
* code = SNOMED#284472007 (exactly)
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
//* method MS
//* method from HsVitalSignMethodVS
//* method ^short = "Väärtus 1156040003 tähendab patsiendi teostatud mõõtmist"
* value[x] only Quantity 
* valueQuantity 1..
* valueQuantity = UCUM#cm "cm"



Instance: VitalSignHeadCircumExample
InstanceOf: HsObservationCircumHead
Title:          "Vital Signs - BodyWeight example"
Description:    "Kehamassi näide"
Usage: #example
* id = "circumhead"
* status = #final
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueQuantity.value = 60


Instance: VitalSignNeckCircumExample
InstanceOf: HsObservationCircumNeck
Title:          "Vital Signs - BodyWeight example"
Description:    "Kehamassi näide (kodus mõõdetud)"
Usage: #example
* id = "circumneck"
* status = #final
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-30"
* performer = Reference(Organization/org1)
* valueQuantity.value = 44
