CodeSystem: HsTobaccoUser
Id: hs-tobacco-user
Title: "Tobacco user"
Description: "Suitetaja kategooriad"
* ^experimental = true
* #702979003 "Never used tobacco"
* #702975009 "Ex-tobacco user"
* #77176002 "Smoker"
  * #160603005 "Light cigarette smoker (1-9/day)"
  * #160604004 "Moderate cigarette smoker (10-19/day)"
  * #160605003 "Heavy cigarette smoker (20-39/day)"
  * #160606002 "Very heavy cigarette smoker (40+/day)"
  * #230065006 "Chain smoker"
* #713914004 "User of smokeless tobacco"
  * #228504007 "User of moist powdered tobacco"
  * #228494002 "Snuff user"
  * #81703003 "Chews tobacco"
    * #228517005 "Chews fine cut tobacco"
    * #228516001 "Chews loose leaf tobacco"
    * #228514003 "Chews plug tobacco"
    * #228518000 "Chews products containing tobacco"

ValueSet: HsTobaccoUser
Id: hs-tobacco-user
Title: "Tobacco user"
Description: "Suitetaja kategooriad"
* ^experimental = false
* include codes from system HsTobaccoUser
//* include codes from system SNOMED where concept = #77176002 "Smoker" and concept = #160603005 and concept = #266920004 and concept = #160605003 and concept = #160606002
//* exclude codes from system SNOMED where concept is-a #266929003 "Smoking started"
//* include codes from system SNOMED where concept is-a #713914004 "User of smokeless tobacco"
//* exclude codes from system SNOMED where concept descendent-of #81703003 "Chews tobacco"

CodeSystem: HsTobaccoSmokeExposure
Id: hs-tobacco-smoke-exposure
Title: "Tobacco Smoke Exposure"
Description: "Tubakasuitsu mõju"
* ^experimental = true
* #711563001 "No known exposure to tobacco smoke"
* #43381005 "Passive smoker"
  * #228524006 "Exposed to tobacco smoke at home"
  * #228523000 "Exposed to tobacco smoke at work"
  * #228525007 "Exposed to tobacco smoke in public places"
* #100801000119107 "Maternal tobacco use in pregnancy"

ValueSet: HsTobaccoSmokeExposure
Id: hs-tobacco-smoke-exposure
Title: "Tobacco Smoke Exposure"
Description: "Tubakasuitsu mõju"
* ^experimental = true
* include codes from system HsTobaccoSmokeExposure

Profile:        HsTobaccoUseObservation
Parent:         HsObservation
Id:             hs-tobacco-use
Title:          "Vital Signs - Tobacco use status"
Description:    "Tubakatarbimise staatus"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* code 1..1 
* code = SNOMED#229819007 "Tobacco use and exposure" (exactly)
* bodySite 0..0
* method 0..0
* interpretation 0..0
* hasMember 0..0
* component 0..0
* effective[x] only dateTime or Period
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from HsTobaccoUser


Instance: TobaccoUseExample
InstanceOf: HsTobaccoUseObservation
Title:          "Vital Signs - Tobacco use observation example"
Description:    "Tubakatarbimise näide"
Usage: #example
* id = "tobacco1"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* valueCodeableConcept = HsTobaccoUser#81703003 "Chews tobacco"


Profile:     HsTobaccoUseFrequencyObservation
Parent:      HsObservation
Id:          hs-tobacco-use-frequency
Title:       "Vital Signs - Tobacco Use Frequency"
Description: "Tubakatarbimise sagedus"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* bodySite 0..0
* method 0..0
* interpretation 0..0
* hasMember 0..0
* component 0..0
* effective[x] only dateTime 
* value[x] only Quantity
* valueQuantity.system = UCUM 
//* valueQuantity.unit = TIME-UNITS

* code.coding 1..1
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    moist 0..1 MS and
    snuff 0..1 MS and
    chewing 0..1 MS
* code.coding[moist] ^short = "Frequency of moist tobacco use"
* code.coding[moist] = SNOMED#228505008 (exactly)
* code.coding[snuff] ^short = "Frequency of snuff use"
* code.coding[snuff] = SNOMED#228495001 (exactly)
* code.coding[chewing] ^short = "Frequency of chewing tobacco"
* code.coding[chewing] = SNOMED#228519008 (exactly)

Instance: TobaccoUseFrequencyExample
InstanceOf:  HsTobaccoUseFrequencyObservation
Title:       "Vital Signs - Frequency of tobacco use observation example"
Description: "Tubakatarbimise sageduse näide"
Usage: #example
* id = "tobacco2"
* code = SNOMED#228505008
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* valueQuantity = UCUM#a "Year"
  * value = 3


Profile:     HsTobaccoSmokeExposureObservation
Parent:      HsObservation
Id:          hs-tobacco-smoke-exposure
Title:       "Vital Signs - Tobacco smoke exposure"
Description: "Tubaka mõju"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* code = SNOMED#714151003 "Environmental tobacco smoke exposure" (exactly)
* bodySite 0..0
* method 0..0
* interpretation 0..0
* hasMember 0..0
* component 0..0
* effective[x] only dateTime 
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from HsTobaccoSmokeExposure

Instance: HsTobaccoSmokeExposureExample
InstanceOf:  HsTobaccoSmokeExposureObservation
Title:       "Vital Signs - Tobacco smoke exposure observation example"
Description: "Tubaka mõju näide"
Usage: #example
* id = "tobacco3"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* valueCodeableConcept = HsTobaccoSmokeExposure#711563001 "No known exposure to tobacco smoke"
