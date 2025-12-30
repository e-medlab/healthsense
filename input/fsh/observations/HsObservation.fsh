Alias: OBSCAT = http://terminology.hl7.org/CodeSystem/observation-category
Alias: INTERPETATION = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias: ABSENTREASON = http://terminology.hl7.org/CodeSystem/data-absent-reason

ValueSet: HsVitalSignMethodVS
Id: hs-vital-sign-method
Title: "VitalSign methods value set"
Description: "Toetatav meetodika eluliste näitajate mõõtmisel"
* ^experimental = false
* include codes from system SNOMED where concept is-a #1156040003 "Patsiendi poolt raporteeritud"
* include codes from system SNOMED where concept is-a #373115008 "Tavaline (spetsialisti poolt mõõdetud)"


Profile:        HsObservation
Parent:         Observation
Id:             hs-observation
Title:          "Generic Clinical Observation"
Description:    "Analüüside, uuringute ja näitajate registreerimiseks mõeldud baasprofiil"
* category 1..1 MS
* subject 1..1 MS
* subject only Reference(Patient)
* code 1..1 MS 
* effective[x] 1.. MS 
//* effective[x] only dateTime
* performer 1..1 MS
* performer only Reference(Organization or PractitionerRole)
* value[x] MS 
* value[x] only Quantity or CodeableConcept or Range
//* valueQuantity.system = UCUM
* dataAbsentReason MS 

Invariant: inv-hs-obs-vitalsign-status-01
Description: "HealthSense toetab ainult \"final - 'Mõõtmine lõplik ja ei vaja tegevusi tulevikus'” or “entered-in-error - 'Mõõtmine on tagasi võetud'"
Severity: #error
Expression: "$this.exists() implies ($this = 'final' or $this = 'entered-in-error')"


Invariant: inv-hs-obs-vitalsign-valueQuantity-value-01
Description: "Value must conform to format: nnn.n or nnn - maximum 3 digits and maximum 1 decimal"
Severity: #error
Expression: "matches('^[0-9][0-9]?[0-9]?(.[0-9])?$')"
