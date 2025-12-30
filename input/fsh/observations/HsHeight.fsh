Alias: $bodyheight = http://hl7.org/fhir/StructureDefinition/bodyheight

Profile: HsObservationBodyHeight
Parent: $bodyheight
Id: hs-observation-bodyheight
Title: "Vital Signs - Body Height"
Description: "Profiil patsiendi kehapikkuse salvestamiseks"
* ^version = "20221128"
* ^status = #active
* meta.lastUpdated MS
* meta.profile 1..
* status obeys inv-hs-obs-vitalsign-status-01
* code.coding MS
* code.coding contains snomed-code 1..1 MS
* code.coding[snomed-code].system 1..
* code.coding[snomed-code].system = SNOMED (exactly)
* code.coding[snomed-code].code 1..
* code.coding[snomed-code].code = #50373000 (exactly)
* encounter MS
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] 1..
* valueQuantity 1..
* valueQuantity = UCUM#cm "cm"
//* valueQuantity.value obeys inv-hs-obs-vitalsign-valueQuantity-value-01
* component ..0




Instance: VitalSignsBodyHeightExample
InstanceOf: HsObservationBodyHeight
Title:          "Vital Signs - BodyHeight example"
Description:    "Kehapikkuse näide"
Usage: #example
* id = "height1"
* status = #final
* category[VSCat] = OBSCAT#vital-signs "Vital Signs"
* subject = Reference(Patient/pat1)
* code.coding[BodyHeightCode] = LOINC#8302-2
* code.coding[snomed-code] = SNOMED#50373000
* code.text = "Body height"
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueQuantity.value = 191.5
