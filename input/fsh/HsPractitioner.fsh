
Instance: PractitionerPeeterRoss
InstanceOf: Practitioner
Title:          "Practitioners - Peeter Ross"
Description:    "Spetsialist Peeter Ross arstikoodiga D00007"
Usage: #example
* id = "pr1"
* identifier.system = "urn:oid:1.3.6.1.4.1.28284.2"
* identifier.value = "D00007"
* active = true
* name.family = "Ross"
* name.given = "Peeter"
* address.line = "Ravi 18"
* address.city = "Tallinn"


Instance: PeeterRoss@ITK
InstanceOf: PractitionerRole
Title:          "Roles - Practitioner Peeter Ross at ITK"
Description:    "ITK Radioloog Peeter Ross"
Usage: #example
* id = "pr1org1"
* active = true
* period.start = "1998-01-01"
* practitioner = Reference(Practitioner/pr1)
* organization = Reference(Organization/org1)
/* Practice Setting Code - http://hl7.org/fhir/R4B/valueset-c80-practice-codes.html */
* specialty = SNOMED#394914008 	 "Radiology"
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#doctor