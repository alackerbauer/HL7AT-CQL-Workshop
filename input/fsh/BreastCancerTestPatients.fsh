Alias: $icd-10-cm = http://hl7.org/fhir/sid/icd-10-cm

Instance: ExamplePatientBundle
InstanceOf: Bundle
Usage: #example
* type = #transaction
* entry[0].resource = Patient1
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/Patient1"
* entry[+].resource = Practitioner1
* entry[=].request.method = #PUT
* entry[=].request.url = "Practitioner/Practitioner1"
* entry[+].resource = Patient1Encounter1
* entry[=].request.method = #PUT
* entry[=].request.url = "Encounter/Patient1Encounter1"
* entry[+].resource = Patient2
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/Patient1"
* entry[+].resource = Patient2Encounter1
* entry[=].request.method = #PUT
* entry[=].request.url = "Encounter/Patient2Encounter1"

Instance: Patient1
InstanceOf: Patient
Usage: #inline
* name.given = "Jane"
* name.family = "Doe"
* gender = #female
* birthDate = "1970-01-01"

Instance: Practitioner1
InstanceOf: Practitioner
Usage: #inline
* name.given = "John"
* name.family = "Smith"
* gender = #male

Instance: Patient1Encounter1
InstanceOf: Encounter
Usage: #inline
* status = #finished
* class.code = #ambulatory
* subject = Reference(Patient1)
* participant.individual = Reference(Practitioner1)
* reasonCode = #123456 "Example reason code"

Instance: Patient2
InstanceOf: Patient
Usage: #inline
* name.given = "Elizabeth"
* name.family = "Bethany"
* gender = #female
* birthDate = "1960-01-01"

Instance: Patient2Encounter1
InstanceOf: Encounter
Usage: #inline
* status = #finished
* class.code = #ambulatory
* subject = Reference(Patient2)
* participant.individual = Reference(Practitioner1)
* period.start = "2023-05-16T19:37:08+02:00"
* period.end = "2023-05-16T20:37:08+02:00"
* reasonCode = $icd-10-cm#Z12.31