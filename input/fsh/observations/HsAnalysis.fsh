
/*
Instance: BloodGroupObservation
InstanceOf: TisObservation
Usage: #example
* meta.source = "https://heda.ph.ee/observations/214141421421"
* category = OBSCAT#laboratory "Laboratory"
* status = #final
* subject = Reference(Patient/pat1)
* code.coding[0] = LOINC#882-1 "AB0 group [Type] in Blood"
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* valueCodeableConcept = SNOMED#112144000 "Blood group A"
* valueCodeableConcept.text = "A"

Instance: BloodRhObservation
InstanceOf: TisObservation
Usage: #example
* meta.source = "urn:tto:ph:90004527:observation:214141421422"
* category = OBSCAT#laboratory "Laboratory"
* status = #final
* subject = Reference(Patient/pat1)
* code.coding[0] = LOINC#10331-7 "Rh [Type] in Blood1"
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* valueCodeableConcept = SNOMED#260385009 "Negatiivne"
* valueCodeableConcept.text = "Neg"


Instance: BgPanelObservation
InstanceOf: TisObservation
Usage: #example
* meta.source = "https://heda.ph.ee/observations/214141421423"
* category = OBSCAT#laboratory "Laboratory"
* status = #final
* subject = Reference(Patient/pat1)
* code.coding[0] = LOINC#34532-2 "Blood type and Indirect antibody screen panel - Blood"
* effectiveDateTime = "2021-11-23"
* performer = Reference(Organization/org1)
* hasMember[0] = Reference(Observation/BloodGroupObservation)
* hasMember[1] = Reference(Observation/BloodRhObservation)




Instance: Poc3SkvAnalyysNaatrium
InstanceOf: TisObservation
Usage: #example
* meta.source = "https://heda.ph.ee/observations/214141421425"
* category = OBSCAT#laboratory "Laboratory"
* subject = Reference(Patient/pat1)
* status = #final
* effectiveDateTime = "2020-10-25T09:30:00Z"
* issued = "2020-10-25T09:33:00Z"
* performer = Reference(Organization/org1)
* specimen = Reference(Specimen/Spcmn1)
* code.coding[0] = LOINC#2951-2 "Naatrium"
* valueString = "Vabatekstiline vastus"


Instance: Poc3SkvAnalyysHemogramm
InstanceOf: TisObservation
Usage: #example
* meta.source = "https://heda.ph.ee/observations/214141421426"
* category = OBSCAT#laboratory "Laboratory"
* subject = Reference(Patient/pat1)
* status = #final
* effectiveDateTime = "2020-03-11T14:30:00Z"
* issued = "2020-03-11T14:35:00Z"
* performer = Reference(PractitionerRole/PractRole11)
* specimen = Reference(Specimen/Spcmn2)
* code.coding[0] = LOINC#58410-2 "Hemogramm"
* note[0].text = "Analüüsi tulemuse märkuse info"
* component[0].code.coding[0] = LOINC#6690-2 "WBC"
* component[0].valueQuantity.value = 7.95
* component[0].valueQuantity = UCUM#10*9/L "10*9/L"
* component[0].referenceRange.low.value = 4.0
* component[0].referenceRange.low = UCUM#10*9/L "10*9/L"
* component[0].referenceRange.high.value = 10.0
* component[0].referenceRange.high = UCUM#10*9/L "10*9/L"
* component[0].interpretation = INTERPETATION#N "Normal"

* component[1].code.coding[0] = LOINC#789-8 "RBC"
* component[1].valueQuantity.value = 4.4
* component[1].valueQuantity = UCUM#10*12/L "10*12/L"
* component[1].referenceRange.low.value = 4.6
* component[1].referenceRange.low = UCUM#10*12/L "10*12/L"
* component[1].referenceRange.high.value = 6.0
* component[1].referenceRange.high = UCUM#10*12/L "10*12/L"
* component[1].interpretation = INTERPETATION#N "Normal"

* component[2].code.coding[0] = LOINC#718-7 "Hb"
* component[2].valueQuantity.value = 142
* component[2].valueQuantity = UCUM#g/L "g/L"
* component[2].referenceRange.low.value = 130
* component[2].referenceRange.low = UCUM#g/L "g/L"
* component[2].referenceRange.high.value = 180
* component[2].referenceRange.high = UCUM#g/L "g/L"
* component[2].interpretation.text = "Tulemust tõlgendav tekst"

* component[3].code.coding[0] = LOINC#51637-7 "Pct"
* component[3].dataAbsentReason.coding[0] = SNOMED#263703002 "Changed status"
* component[3].dataAbsentReason.coding[1] = ABSENTREASON#not-performed "Not performed"
* component[3].dataAbsentReason.text = "Põhjus, miks Pct tulemus tühistati"


Instance: Poc3SkvAnalyysMikrobioloogia
InstanceOf: TisObservation
Usage: #example
* meta.source = "https://heda.ph.ee/observations/214141421427"
* category = OBSCAT#laboratory "Laboratory"
* subject = Reference(Patient/pat1)
* status = #final
* effectiveDateTime = "2020-03-11T14:30:00Z"
* issued = "2020-03-12T14:32:00Z"
* performer = Reference(Organization/org1)
* specimen = Reference(Specimen/Spcmn3)
* code.coding[0] = LOINC#634-6 "Aeroobne külv"
* note[0].text = "Analüüsi tulemuse märkus"
* valueCodeableConcept = SNOMED#260385009 "negatiivne"
* interpretation.text = "Tulemust tõlgendav tekst"

* component[0].code.coding[0] = LOINC#45335-7 "Mikroobide samastamine"
* component[0].valueCodeableConcept = SNOMED#112283007 "Escherichia coli"

* component[1].code.coding[0] = LOINC#565-2 "Mikroobide hulk külvis"
* component[1].valueCodeableConcept = QuantityOfMicrobesOID#003 "3+"
* component[1].interpretation = INTERPETATION#N "Normal"

* component[2].code.coding[0] = LOINC#18862-3 "Amoksitsilliin+klavulaanhape"
* component[2].valueCodeableConcept = SNOMED#30714006 "Resistentne"
* component[2].valueCodeableConcept.text = "Analüüsi tulemuse märkuse info"
* component[2].interpretation.text = "Tulemuse tõlgenduse tekst"
*/