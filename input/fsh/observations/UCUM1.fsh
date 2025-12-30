
Instance: UCUMUnit1Example
InstanceOf: Observation
Title:          "Observation example with UCUM unit code=1"
Description:    "Näide UCUM ühikuga 1"
Usage: #example
* id = "ucum1"
* status = #final
* category = OBSCAT#laboratory "Laboratory"
* subject = Reference(Patient/pat1)
* code.coding[0] = LOINC#15074-8 "Glucose [Moles/volume] in blood"
* effectiveDateTime = "2021-11-24"
* method = SNOMED#311503006 "With or after meal"
* performer = Reference(Organization/org1)
* valueQuantity.value = 30
* valueQuantity = UCUM#1 "pcs"
