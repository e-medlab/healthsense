Alias: $bp = http://hl7.org/fhir/StructureDefinition/bp

ValueSet: HsBloodPressureBodySiteVS
Id: hs-blood-pressure-body-site
Title: "BloodPressure body site value set"
Description: "Kehaosad kus saab mõõta vererõhu"
* ^experimental = false
* include codes from system SNOMED where concept is-a #80768000 "Vasak ülajäse või selle osa"
* include codes from system SNOMED where concept is-a #6921000 "Parem ülajäse või selle osa"



/* Implementation idea taken from Medicare - https://fhir.medirecords.com/StructureDefinition-mr-observation-vitalsign-bp.html */
Profile:        HsBloodPressureObservation
Parent:         HsObservation
Id:             hs-blood-pressure
Title:          "Vital Signs - Blood Pressure"
Description:    "Vererõhu profiil"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* bodySite 1..1 MS
* bodySite from HsBloodPressureBodySiteVS
* method 0..1 MS
* method from HsVitalSignMethodVS
* method ^short = "Väärtus 1156040003 tähendab patsiendi teostatud mõõtmist"
* hasMember 0..0

* code.coding 1..3
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    bpGeneral 1..1 MS and
    bpLoinc 0..1 MS and
    bpLying 0..1 MS and
    bpSitting 0..1 MS and
    bpStanding 0..1 MS
* code.coding[bpGeneral] ^short = "Blood Pressure"
* code.coding[bpGeneral] = SNOMED#75367002 (exactly)
* code.coding[bpLoinc] ^short = "Blood pressure panel with all children optional"
* code.coding[bpLoinc] = LOINC#85354-9 (exactly)
* code.coding[bpLying] ^short = "Lying blood pressure"
* code.coding[bpLying] = SNOMED#163033001 (exactly)
* code.coding[bpSitting] ^short = "Sitting Blood Pressure"
* code.coding[bpSitting] = SNOMED#163035008 (exactly)
* code.coding[bpStanding] ^short = "Standing Blood Pressure"
* code.coding[bpStanding] = SNOMED#163034007 (exactly)

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains systolicBP 1..1 MS and diastolicBP 1..1 MS
* component[systolicBP].code = SNOMED#271649006 "Systolic blood pressure"
* component[diastolicBP].code = SNOMED#271650006 "Diastolic blood pressure"

* component[systolicBP] ^short = "Systolic Blood Pressure"
* component[systolicBP].code.coding 0..2 //should cardinality 2 because first layer slicing use the exactly same code
* component[systolicBP].code.coding ^slicing.discriminator.type = #pattern
* component[systolicBP].code.coding ^slicing.discriminator.path = "$this"
* component[systolicBP].code.coding ^slicing.rules = #open
* component[systolicBP].code.coding contains
    //systolicBPGeneral 1..1 MS and
    systolicBPLying 0..1 MS and
    systolicBPSitting 0..1 MS and
    systolicBPStanding 0..1 MS
//* component[systolicBP].code.coding[systolicBPGeneral] ^short = "Systolic Blood Pressure"
//* component[systolicBP].code.coding[systolicBPGeneral] = SNOMED#271649006 (exactly)
* component[systolicBP].code.coding[systolicBPLying] ^short = "Lying Systolic Blood Pressure"
* component[systolicBP].code.coding[systolicBPLying] = SNOMED#407556006 (exactly)
* component[systolicBP].code.coding[systolicBPSitting] ^short = "Sitting Systolic Blood Pressure"
* component[systolicBP].code.coding[systolicBPSitting] = SNOMED#407554009 (exactly)
* component[systolicBP].code.coding[systolicBPStanding] ^short = "Standing Systolic Blood Pressure"
* component[systolicBP].code.coding[systolicBPStanding] = SNOMED#400974009 (exactly)

* component[systolicBP].value[x] only Quantity
* component[systolicBP].valueQuantity = UCUM#mm[Hg] "mmHg" 

* component[diastolicBP] ^short = "Diastolic Blood Pressure"
* component[diastolicBP].code.coding 0..2
* component[diastolicBP].code.coding ^slicing.discriminator.type = #pattern
* component[diastolicBP].code.coding ^slicing.discriminator.path = "$this"
* component[diastolicBP].code.coding ^slicing.rules = #open
* component[diastolicBP].code.coding contains
    //diastolicBPGeneral 1..1 MS and
    diastolicBPLying 0..1 MS and
    diastolicBPSysSitting 0..1 MS and
    diastolicBPSysStanding 0..1 MS
//* component[diastolicBP].code.coding[diastolicBPGeneral] ^short = "Diastolic Blood Pressure"
//* component[diastolicBP].code.coding[diastolicBPGeneral] = SNOMED#271650006  (exactly)
* component[diastolicBP].code.coding[diastolicBPLying] ^short = "Lying Diastolic Blood Pressure"
* component[diastolicBP].code.coding[diastolicBPLying] = SNOMED#407557002 (exactly)
* component[diastolicBP].code.coding[diastolicBPSysSitting] ^short = "Sitting Diastolic Blood Pressure"
* component[diastolicBP].code.coding[diastolicBPSysSitting] = SNOMED#407555005 (exactly)
* component[diastolicBP].code.coding[diastolicBPSysStanding] ^short = "Standing Diastolic Blood Pressure"
* component[diastolicBP].code.coding[diastolicBPSysStanding] = SNOMED#400975005 (exactly)

* component[diastolicBP].value[x] only Quantity
* component[diastolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"


Instance: BloodPressureExample
InstanceOf: HsBloodPressureObservation
Title:          "Vital Signs - Blood pressure observation example"
Description:    "Vererõhu näide"
Usage: #example
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final
* code.coding[bpGeneral] = SNOMED#75367002 //"Blood Pressure"
* code.coding[bpLying] = SNOMED#163033001 //"Lying blood pressure"
* code.coding[bpLoinc] = LOINC#85354-9 //"Blood pressure panel with all children optional"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* bodySite = SNOMED#80768000 "Structure of left upper limb"
* performer = Reference(Organization/org1)
* component[systolicBP].code.coding[systolicBPLying] = SNOMED#407556006 //"Lying Systolic Blood Pressure"
* component[systolicBP].valueQuantity.value = 120
* component[diastolicBP].code.coding[diastolicBPLying] = SNOMED#407557002 //"Lying Diastolic Blood Pressure"
* component[diastolicBP].valueQuantity.value = 80


/*
This is original very simple LOINC based profile
Profile:        HsBloodPressureObservation1
Parent:         HsObservation
Id:             hs-blood-pressure1
Title:          "BloodPressure Observation"
Description:    "Vererõhu profiil"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final
* code = LOINC#85354-9 "Blood pressure panel with all children optional"
* code.text = "Blood pressure systolic and diastolic"
* bodySite 1..1
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains systolicBP 1..1 MS and diastolicBP 1..1 MS
* component[systolicBP].code = LOINC#8480-6 "Systolic blood pressure"
* component[systolicBP].value[x] only Quantity
* component[systolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
* component[diastolicBP].code = LOINC#8462-4 "Diastolic blood pressure"
* component[diastolicBP].value[x] only Quantity
* component[diastolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
*/




Profile: HsObservationBloodPressure2
Parent: $bp
Id: hs-observation-bp2
Title: "Vital Signs - Blood Pressure2"
Description: "Vererõhk (positsiooniga)"
* ^status = #active
* status obeys inv-hs-obs-vitalsign-status-01
* code.coding MS
* code.coding contains snomed-code 1..1 MS
* code.coding[snomed-code].system 1..
* code.coding[snomed-code].system = SNOMED (exactly)
* code.coding[snomed-code].code 1..
* code.coding[snomed-code].code = #75367002 (exactly)
* code.coding[snomed-code] ^short = "Blood Pressure"
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* component contains
    position 0..1 MS
* component[SystolicBP].code.coding 2..2
* component[SystolicBP].code.coding contains snomedSBP 1..1 
* component[SystolicBP].code.coding[snomedSBP] ^short = "SNOMED CT Systolic Blood Pressure"
* component[SystolicBP].code.coding[snomedSBP].system 1..
* component[SystolicBP].code.coding[snomedSBP].system = "http://snomed.info/sct" (exactly)
* component[SystolicBP].code.coding[snomedSBP].code 1..
* component[SystolicBP].code.coding[snomedSBP].code = #271649006 (exactly)
* component[DiastolicBP].code.coding 2..2
* component[DiastolicBP].code.coding contains snomedDBP 1..1
* component[DiastolicBP].code.coding[snomedDBP] ^short = "SNOMED CT Diastolic Blood Pressure"
* component[DiastolicBP].code.coding[snomedDBP].system 1..
* component[DiastolicBP].code.coding[snomedDBP].system = "http://snomed.info/sct" (exactly)
* component[DiastolicBP].code.coding[snomedDBP].code 1..
* component[DiastolicBP].code.coding[snomedDBP].code = #271650006 (exactly)

* component[position] ^short = "Kehapositsioon vererõhu mõõtmisel"
/*
* component[position].code.coding ^slicing.discriminator.type = #value
* component[position].code.coding ^slicing.discriminator.path = "code"
* component[position].code.coding ^slicing.ordered = false
* component[position].code.coding ^slicing.rules = #open
* component[position].code.coding contains
    BodyPositionSNOMED 0..1 and
    BodyPositionLOINC 0..1
* component[position].code.coding[BodyPositionSNOMED] ^short = "Body position"
* component[position].code.coding[BodyPositionSNOMED] ^definition = "Body position for blood pressure measurement"
* component[position].code.coding[BodyPositionSNOMED].system = "http://snomed.info/sct" (exactly)
* component[position].code.coding[BodyPositionSNOMED].code = #424724000 (exactly)
* component[position].code.coding[BodyPositionLOINC].system = "http://loinc.org" (exactly)
* component[position].code.coding[BodyPositionLOINC].code = #8361-8 (exactly)
*/
* component[position].code = SNOMED#424724000 (exactly)
//* component[position].code.coding.system = SNOMED (exactly)
//* component[position].code.coding.code = #424724000 (exactly)
* component[position].value[x] only CodeableConcept
* component[position].valueCodeableConcept ^definition = "The position of the patient when the blood pressure was measured."
* component[position].valueCodeableConcept from HsBloodPressurePositionVS
//* component[position].valueCodeableConcept ^binding.strength = #extensible
//* component[position].valueCodeableConcept ^binding.valueSetReference.reference = "http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.5--20150401000000"

Instance: BloodPressureExample2
InstanceOf: HsObservationBloodPressure2
Title:          "Vital Signs - Blood pressure observation example with position"
Description:    "Vererõhu näide"
Usage: #example
//* category = OBSCAT#vital-signs "Vital Signs"
* status = #final
//* code.coding[bpGeneral] = SNOMED#75367002 //"Blood Pressure"
//* code.coding[bpLoinc] = LOINC#85354-9 //"Blood pressure panel with all children optional"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* bodySite = SNOMED#80768000 "Structure of left upper limb"
* performer = Reference(Organization/org1)
* component[SystolicBP].valueQuantity.value = 120
* component[SystolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
* component[DiastolicBP].valueQuantity.value = 80
* component[DiastolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
* component[position].valueCodeableConcept = SNOMED#33586001 "Sitting position"


ValueSet: HsBloodPressurePositionVS
Id: hs-blood-pressure-position
Title: "BloodPressure position"
//Description: "Kehapositsioon vererõhu mõõtmisel"
* ^experimental = false
* SNOMED#102538003 "Lying position"
* SNOMED#33586001 "Sitting position"
* SNOMED#10904000 "Standing position"

Profile: HsObservationBloodPressure3
Parent: $bp
Id: hs-observation-bp3
Title: "Vital Signs - Blood Pressure3"
Description: "Blood Pressure with Position component"
* component contains
    position 0..1 MS

* component[position].code ^comment = "additional codes that translate or map to this code are allowed.  For example a more granular LOINC code or code that is used locally in a system."
* component[position].code.coding ^slicing.discriminator[0].type = #value
* component[position].code.coding ^slicing.discriminator[=].path = "code"
* component[position].code.coding ^slicing.discriminator[+].type = #value
* component[position].code.coding ^slicing.discriminator[=].path = "system"
* component[position].code.coding ^slicing.ordered = false
* component[position].code.coding ^slicing.rules = #open
* component[position].code.coding ^short = "Body position"
* component[position].code.coding ^definition = "Blood Pressure position."
* component[position].code.coding contains SCTCode 1..1
* component[position].code.coding[SCTCode] ^short = "Body position"
* component[position].code.coding[SCTCode] ^definition = "Body position for blood pressure measurement."
* component[position].code.coding[SCTCode].system 1..1
* component[position].code.coding[SCTCode].system only uri
* component[position].code.coding[SCTCode].system = SNOMED (exactly)
* component[position].code.coding[SCTCode].code 1..1
* component[position].code.coding[SCTCode].code only code
* component[position].code.coding[SCTCode].code = #424724000 (exactly)
* component[position].value[x] only CodeableConcept
* component[position].valueCodeableConcept ^definition = "The position of the patient when the blood pressure was measured."
* component[position].valueCodeableConcept from HsBloodPressurePositionVS

Instance: BloodPressureExample3
InstanceOf: HsObservationBloodPressure3
Title:          "Vital Signs - Blood pressure observation example with position"
Description:    "Blood Pressure example3"
Usage: #example
* status = #final
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* component[SystolicBP].valueQuantity.value = 120
* component[SystolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
* component[DiastolicBP].valueQuantity.value = 80
* component[DiastolicBP].valueQuantity = UCUM#mm[Hg] "mmHg"
* component[position].valueCodeableConcept = SNOMED#33586001 "Sitting position"
