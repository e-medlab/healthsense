
CodeSystem: HsDrinkingAcoholProduct
Id: hs-drinking-alcohol-product
Title: "Alcohol Product Drinking Finding"
Description: "Alkohoolsete toodete kasutamine"
* ^experimental = true
* #105542008 "Current non-drinker of alcohol"
* #225578007 "Drinking finding"
  * #447087000 "Drinks alcoholic cider"
  * #160589000 "Beer drinker"
  * #160591008 "Drinks wine"
  * #160588008 "Drinker of hard liquor"

ValueSet: HsDrinkingAcoholProduct
Id: hs-drinking-alcohol-product
Title: "Drinking Finding"
Description: "Alkohoolsete toodete kasutamine"
* ^experimental = true
* include codes from system HsDrinkingAcoholProduct

CodeSystem: HsAlcoholDrinkingStatus
Id: hs-alcohol-drinking-status
Title: "Alcohol Drinking Status"
Description: "Alkohooli tarbimise tase"
* ^experimental = true
* #105542008 "Current non-drinker of alcohol"
* #82581004	 "Ex-drinker"
* #28127009	 "Social drinker"
* #219006	 "Current drinker"
  * #266917007 "Occasional drinker - <1u/day"
  * #160575005 "Light drinker - 1-2u/day"
  * #160576006 "Moderate drinker - 3-6u/day"
  * #160577002 "Heavy drinker - 7-9u/day"
  * #160578007 "Very heavy drinker - greater than 9 units/day"

ValueSet: HsAlcoholDrinkingStatus
Id: hs-alcohol-drinking-status
Title: "Vital Signs - Alcohol Drinking Status"
Description: "Alkohooli tarbimise tase"
* ^experimental = true
* include codes from system HsAlcoholDrinkingStatus
 

Profile:        HsAlchocolIntakeObservation
Parent:         HsObservation
Id:             hs-alcohol-intake
Title:          "Vital Signs - Alchocol intake"
Description:    "Alkoholi tarbimine"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* code.coding 1..2
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    general 1..1 MS and
    cider 0..1 and beer 0..1 and wine 0..1 and  liquor 0..1
* code.coding[general] = SNOMED#897148007 "Alcoholic beverage intake"
* code.coding[cider] = SNOMED#896792007 "Cider intake"
* code.coding[beer] = SNOMED#230085005 "Beer  intake"
* code.coding[wine] = SNOMED#230086006 "Wine intake"
* code.coding[liquor] = SNOMED#230088007 "Hard liquor intake"

* bodySite 0..0 
* interpretation 0..1
* interpretation from HsAlcoholDrinkingStatus
* effective[x] only dateTime or Period
* referenceRange 0..0
* method 0..0 
* hasMember 0..0
* component 0..0
* value[x] 1..
* value[x] only Quantity
* valueQuantity = UCUM#[IU]/d "unit per day"

Instance: AlchocolIntakeExample
InstanceOf: HsAlchocolIntakeObservation
Title:          "Vital Signs - Alchocol intake observation example"
Description:    "Alkoholi tarbimise näide"
Usage: #example
* id = "alchocol1"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* interpretation = HsAlcoholDrinkingStatus#266917007 "Occasional drinker - <1u/day"
* valueQuantity.value = 1


Profile:        HsAlchocolDrinkingBehaviorObservation
Parent:         HsObservation
Id:             hs-alcohol-drinking-behavior
Title:          "Vital Signs - Alchocol product drinking behavior"
Description:    "Alkoholitoodete joomine"
* category = OBSCAT#vital-signs "Vital Signs"
* status = #final (exactly)
* code = SNOMED#363905002 "Details of alcohol drinking behavior"
* bodySite 0..0 
* interpretation 0..0
* effective[x] only dateTime
* referenceRange 0..0
* method 0..0 
* hasMember 0..0
* component 0..0
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from HsDrinkingAcoholProduct


Instance: AlchocolDrinkingBehaviorExample
InstanceOf: HsAlchocolDrinkingBehaviorObservation
Title:          "Vital Signs - Alchocol drinking behavior observation example"
Description:    "Alkoholi tarbimise käitumise näide"
Usage: #example
* id = "alchocol2"
* subject = Reference(Patient/pat1)
* effectiveDateTime = "2021-11-24"
* performer = Reference(Organization/org1)
* valueCodeableConcept = HsDrinkingAcoholProduct#160591008 "Drinks wine"

