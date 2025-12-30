/*
CodeSystem: HsGlucoseLevelFinding
Id: hs-glucose-level-finding
Title: "Glucose Level Finding"
Description: "Glükoosi tase"
* ^experimental = true
* #102659003 "Normal glucose level"
* #68256003 "Increased glucose level"
* #102660008 "Abnormal glucose level"
* #45154002 "Glycosuria"
*/

ValueSet: HsGlucoseLevelFinding
Id: hs-glucose-level-finding
Title: "Glucose Level Finding"
Description: "Glükoosi tase"
* ^experimental = true
//* include codes from system HsGlucoseLevelFinding
* SNOMED#102659003 "Normal glucose level"
* SNOMED#68256003 "Increased glucose level"
* SNOMED#102660008 "Abnormal glucose level"
* SNOMED#45154002 "Glycosuria"

ValueSet: HsMeasurementTiming
Id: hs-measurement-timing
Title: "Measurement Timing"
Description: "Mõõtmise aeg"
* ^experimental = false
* SNOMED#307165006 "Before meal"
* SNOMED#309613002 "Between meals"
* SNOMED#309612007 "During meal"
* SNOMED#24863003 "Postprandial"
* SNOMED#311503006 "With or after meal"
* SNOMED#424616004 "Without regard to meals"

Profile:        HsGlucoseObservation
Parent:         HsObservation
Id:             hs-glucose
Title:          "Lab - Glucose in blood"
Description:    "Glükoosi mõõtmine veres"
* category = OBSCAT#laboratory "Laboratory"
* status = #final (exactly)
* code = LOINC#15074-8 "Glucose [Moles/volume] in blood"
* bodySite 0..0 
* hasMember 0..0
* component 0..0
* interpretation 1..2 MS
* interpretation from HsGlucoseLevelFinding
* effective[x] only dateTime
* referenceRange MS
* method MS 
* method from HsMeasurementTiming
* value[x] 1..
* value[x] only Quantity
* valueQuantity = UCUM#mmol/l "mmol/l"

Instance: GlucoseExample
InstanceOf: HsGlucoseObservation
Title:          "Lab - Glucose observation example"
Description:    "Glükoosi näide"
Usage: #example
* id = "glucose1"
* status = #final
* category = OBSCAT#laboratory "Laboratory"
* subject = Reference(Patient/pat1)
* code.coding[0] = LOINC#15074-8 "Glucose [Moles/volume] in blood"
* effectiveDateTime = "2021-11-24"
* method = SNOMED#311503006 "With or after meal"
* performer = Reference(Organization/org1)
* valueQuantity.value = 6.3
* valueQuantity = UCUM#mmol/l "mmol/l"
* referenceRange.low.value = 3.1
* referenceRange.low = UCUM#mmol/l "mmol/l"
* referenceRange.high.value = 6.2
* referenceRange.high = UCUM#mmol/l "mmol/l"
* interpretation = SNOMED#68256003 "Increased glucose level"


ValueSet: HsHemoglobinA1cFinding
Id: hs-hemoglobin-aic-finding
Title: "Hemoglobin A1c Finding"
Description: "Hemoglobin A1c Finding"
* ^experimental = false
* SNOMED#444751005 "Hemoglobin A1c above reference range (finding)"
* SNOMED#165679005 "Hemoglobin A1c less than 7% indicating good diabetic control (finding)"
* SNOMED#165680008 "Hemoglobin A1c between 7%-10% indicating borderline diabetic control (finding)"
* SNOMED#165681007 "Hemoglobin A1c greater than 10% indicating poor diabetic control (finding)"

Profile:        HsHemoglobinA1cObservation
Parent:         HsObservation
Id:             hs-hemoglobin-a1c
Title:          "Lab - Hemoglobin A1c target"
Description:    "Hemoglobin A1c target"
* category = OBSCAT#laboratory "Laboratory"
* status = #final (exactly)
* code = SNOMED#408591000 "Hemoglobin A1c target"
* bodySite 0..0 
* hasMember 0..0
* component 0..0
* effective[x] only dateTime
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from HsHemoglobinA1cFinding (extensible)

Instance: HemoglobinA1cExample
InstanceOf: HsHemoglobinA1cObservation
Title:          "Lab - HemoglobinA1c observation example"
Description:    "Hemaglobiini näide"
Usage: #example
* id = "hemaglobin1"
* status = #final
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueCodeableConcept = SNOMED#444751005 "Hemoglobin A1c above reference range (finding)"


ValueSet: HsDiabetesType
Id: hs-diabetes-type
Title: "Diabetes mellitus types"
Description: "Diabetes mellitus types"
* ^experimental = false
* SNOMED#46635009 "Diabetes mellitus type 1"
* SNOMED#44054006 "Diabetes mellitus type 2"

Profile:        HsDiabetesTypeObservation
Parent:         HsObservation
Id:             hs-diabetes-type
Title:          "Lab - Diabetes mellitus type"
Description:    "Diabetes mellitus type"
* category = OBSCAT#laboratory "Laboratory"
* status = #final (exactly)
* code = SNOMED#405751000 "Diabetes type"
* bodySite 0..0 
* hasMember 0..0
* component 0..0
* effective[x] only dateTime
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from HsDiabetesType (extensible)

Instance: DiabetesTypeExample
InstanceOf: HsDiabetesTypeObservation
Title:          "Lab - DiabetesType observation example"
Description:    "DiabetesType näide"
Usage: #example
* id = "diabetes-type-1"
* status = #final
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueCodeableConcept = SNOMED#44054006 "Diabetes mellitus type 2"

