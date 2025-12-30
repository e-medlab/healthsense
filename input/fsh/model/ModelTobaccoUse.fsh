Logical: TobaccoUseModel
Parent: Element
Id: tobacco-use-model
* patient 1..1 Reference(Patient) "Patient" "Subject of procedure." 
* effectiveTime 1..1 dateTime "Effective time" "When the observation was measured." 
* value 1..1 Coding "The actual coded result of observation." "" 
* value from https://ig.kodality.dev/healthsense/ValueSet-hs-tobacco-user.json (required) 
* note 0..1 string "Comments about the observation" "Comments about the observation or the results."

/*
Mapping: category 
Id: category 
Title: "Observation category" 
Source: TobaccoUseModel 
Target: "http://terminology.hl7.org/CodeSystem/observation-category" 
* -> "vital-signs" 


Mapping: sct
Id: sct 
Title: "Value binding to SNOMED CT" 
Source: TobaccoUseModel 
Target: "http://snomed.info/conceptdomain" 
* -> "229819007 |Tobacco use and exposure|" 
* value -> "702979003 |Never used tobacco| or 702975009 |Ex-tobacco user| or 77176002 |Smoker| or 160603005 |Light cigarette smoker (1-9/day)| or 160604004 |Moderate cigarette smoker (10-19/day)| or 160605003 |Heavy cigarette smoker (20-39/day)| or 160606002 |Very heavy cigarette smoker (40+/day)| or 230065006 |Chain smoker| or 713914004 |User of smokeless tobacco| or 228504007 |User of moist powdered tobacco| or 228494002 |Snuff user| or 81703003 |Chews tobacco| or 228517005 |Chews fine cut tobacco| or 228516001 |Chews loose leaf tobacco| or 228514003 |Chews plug tobacco| or 228518000 |Chews products containing tobacco|"
*/
