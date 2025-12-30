//Alias: IdentityTypeCS =  http://terminology.hl7.org/CodeSystem/v2-0203
//Alias: CountryVS = http://hl7.org/fhir/ValueSet/iso3166-1-3 

Instance: PatientIgorBossenko
InstanceOf: Patient
Title:          "Patients - Igor Bossenko"
Description:    "Patsient Igor Bossenko. Näide mitme identifikaatoritega."
Usage: #example
* id = "pat1"
* identifier[0]
  * system = "urn:pin:hl7.ee:pid:ni:est"
  * value = "37302102711"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:ni:uzb"
  * value = "31002736540023"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:cz:est"
  * value = "AB0421183"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"
* identifier[+]
  * system = "urn:pin:hl7.ee:pid:ppn:est"
  * value = "K0307337"
  * period.end = "2023-12-28"
  * assigner.display = "Estonian Police and Board Agency"  
* active = true
* name[0]
  * use = #official
  * given = "Igor"
  * family = "Bossenko"
* gender = #male
* birthDate = "1973-02-10"
* address
  * line = "Valukoja 10"
  * city = "Tallinn"
  * country = "EST"
  * postalCode = "14215"


