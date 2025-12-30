Alias: $bodyweight = http://hl7.org/fhir/StructureDefinition/bodyweight

Profile: HsObservationBodyWeight
Parent: $bodyweight
Id: hs-observation-bodyweight
Title: "Vital Sign - Body Weight"
Description: "Kehamassi mõõtmine"
* ^status = #active
* status obeys inv-hs-obs-vitalsign-status-01
* code.coding MS
* code.coding contains snomed-code 1..1 MS
* code.coding[snomed-code].system 1..
* code.coding[snomed-code].system = SNOMED (exactly)
* code.coding[snomed-code].code 1..
* code.coding[snomed-code].code = #27113001 (exactly)
* code.text = "Body weight"
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* method MS
* method from HsVitalSignMethodVS
* method ^short = "Väärtus 1156040003 tähendab patsiendi teostatud mõõtmist"
* value[x] only Quantity 
* valueQuantity 1..1
* valueQuantity = UCUM#kg "kg"
//* valueQuantity.value obeys inv-hs-obs-vitalsign-valueQuantity-value-01

Instance: VitalSignBodyWeightExample
InstanceOf: HsObservationBodyWeight
Title:          "Vital Signs - BodyWeight example"
Description:    "Kehamassi näide"
Usage: #example
* id = "weight-regular"
* status = #final
//* category[VSCat] = OBSCAT#vital-signs "Vital Signs"
* subject = Reference(Patient/pat1)
* code.coding[BodyWeightCode] = LOINC#29463-7
* code.coding[snomed-code] = SNOMED#27113001
//* code.text = "Body height"
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueQuantity.value = 99.9


Instance: VitalSignBodyWeightSelfReportedExample
InstanceOf: HsObservationBodyWeight
Title:          "Vital Signs - BodyWeight example"
Description:    "Kehamassi näide (kodus mõõdetud)"
Usage: #example
* id = "weight-self-reported"
* status = #final
//* category[VSCat] = OBSCAT#vital-signs "Vital Signs"
* subject = Reference(Patient/pat1)
* code.coding[BodyWeightCode] = LOINC#29463-7
* code.coding[snomed-code] = SNOMED#27113001
//* code.text = "Body height"
* effectiveDateTime = "2021-11-30"
* performer = Reference(Organization/org1)
* method = SNOMED#1156040003 "Self reported"
* valueQuantity.value = 95



Profile: HsObservationBirthWeight
Parent: HsObservation
Id: hs-observation-birthweight
Title: "Vital Sign - Birth Weight"
Description: "Sünnikaal"
* ^status = #active
* status obeys inv-hs-obs-vitalsign-status-01
* category = OBSCAT#vital-signs "Vital Signs" (exactly)
* code.coding 1..2 MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open
* code.coding contains snomed 1..1 MS and loinc 1..1 MS
* code.coding[snomed].system 1..
* code.coding[snomed].system = SNOMED (exactly)
* code.coding[snomed].code 1..
* code.coding[snomed].code = #364589006 (exactly)
* code.coding[loinc].system 1..
* code.coding[loinc].system = LOINC (exactly)
* code.coding[loinc].code 1..
* code.coding[loinc].code = #8339-4 (exactly)
* code.text = "Birth weight"
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] only Quantity 
* valueQuantity 1..1
* valueQuantity = UCUM#g "g"


Instance: VitalSignBirthWeightExample
InstanceOf: HsObservationBirthWeight
Title:          "Vital Signs - BirthWeight example"
Description:    "Sünnikaalu näide"
Usage: #example
* id = "weight-birth"
* status = #final
* category = OBSCAT#vital-signs "Vital Signs"
* subject = Reference(Patient/pat1)
* code.coding[snomed] = SNOMED#364589006
* code.coding[loinc] = LOINC#8339-4
//* code.text = "Body height"
* effectiveDateTime = "1973-02-10"
* performer = Reference(Organization/org1)
* valueQuantity.value = 3501
