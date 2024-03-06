library BloodDonationInitialExpressions version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000'
codesystem "LOINC": 'http://loinc.org'
codesystem "BiologicallyDerivedProductCodes": 'http://hl7.org/fhir/biologicallyderived-productcodes'
//TODO change code
code "weight": '29463-7' from "LOINC"
code "pulse": '29463-7' from "LOINC"
code "bloodPressure": '29463-7' from "LOINC"
code "temperature": '29463-7' from "LOINC"
code "hemoglobin": '29463-7' from "LOINC"

code "blood":  'e0398' from "BiologicallyDerivedProductCodes"

context Patient

define "Title Familyname":
      Combine(Patient.name.prefix,' ') + ',' + Combine(Patient.name.family,' ')

define "First name":
    Patient.name.given

define "Street Number":
    Patient.address.line
define "Postal Code":
    Patient.address.postalCode
define "City":
    Patient.address.city

define "Phone":
   singleton from (Patient.telecom P where P.use = 'mobile')

define "Email":
   singleton from (Patient.telecom P where P.use = 'email')


define "Birthdate":
    Patient.birthDate

define "Gender":
    case 
        when  Patient.gender = 'female' then 'w'
        when  Patient.gender = 'male' then 'm'
        else ''
    end


define "Date":
    Today() as Date


define "Blood Pressure":
Last([Observation] O 
    where "bloodPressure" in O.code.coding 
    and O.issued = Today()//Observation has to be from the same day
    sort by issued).value

define "Pulse":
Last([Observation] O 
    where "pulse" in O.code.coding 
    and O.issued = Today()//Observation has to be from the same day
    sort by issued).value

define "Temperature":
Last([Observation] O 
    where "temperature" in O.code.coding 
    and O.issued = Today()//Observation has to be from the same day
    sort by issued).value

define "Hemoglobin":
    Last([Observation] O 
    where "hemoglobin" in O.code.coding 
    and O.issued = Today()//Observation has to be from the same day
    sort by issued).value


define "Weigh over 50kg":
    Last([Observation] O 
    where "weight" in O.code.coding 
    and O.issued after Today()-6 months //Observation cannot be older than 6 months
    sort by issued).value > 50

define "Past Blood Donations":
    [BiologicallyDerivedProduct] B
    where EndsWith(B.collection.source.reference, Patient.id) 
    and B.productCode = "blood" 
    sort by collection.collected

define "Donated Blood Before":
    if exists("Past Blood Donations") then 'yes'
    else 'no'


define "Last Blood Donation Date":
 Last("Past Blood Donations").collection.collected


/*define "Pregnancy in Last 6 Months":
define "End of last Pregnancy":
define "Given Birth":
*/

/*define "Currently in medical treatment or sick leave":
define "Since when and why":
define "Taking medication regularly":
define "Which medications and when last taken?":*/
define "Requested Medications within last 4 weeks":
[MedicationRequest] M
    where M.authoredOn after Today()- 4 weeks


define "Medication in the last 4 weeks":
    if exists("Requested Medications within last 4 weeks")
    then 'yes'
    else 
        'no'


define "Which medications and when last taken":
    ([Medication] M where EndsWith(First("Requested Medications within last 4 weeks".medication.reference), M.id))

/*
define "Medication for acne in the last 12 months":
define "Medication to prevent a virus infection in the last 12 months":
define "Acitretin medication in the last 3 years":
define "Dental or minor surgical treatment in the last 4 weeks":
*/

define "Vaccinations within the last 4 weeks":
    [Immunization] I where I.occurrence after Today()- 4 weeks

define "Vaccinated in the last 4 weeks":
if exists("Vaccinations within the last 4 weeks") then 'yes'
else 'no'

define "Which vaccinations within the last 4 weeks":
  "Vaccinations within the last 4 weeks".vaccineCode


/*
define "Current allergy or desensitization":
define "Current skin inflammation":
define "Tick bite in last 8 weeks":
define "Infection in last 4 weeks":

define "Contact with foreign blood":

define "Unexplained fever or lymph node swelling":
define "Hospital stay or medical treatment":
define "Contact with infectious diseases":
define "Heart or circulatory disease":
define "Chronic illness":
define "Blood products or coagulation factors":
define "Blood products or coagulation factors reasons":

define "Born or stayed outside of Europe":

define "Past Infections":
define "Risk of tuberculosis or similar diseases":


define "Treatment with growth hormones before 1990":
define "Undergone stereotactic surgery":
*/


define "Organ or tissue transplant":
    [Procedure] P 
    with [BiologicallyDerivedProduct] B such that EndsWith(First(P.usedReference.reference), B.id) and B.productCategory in {'organ','cell','tissue'}
    //changed to P.used in R5
    where  EndsWith(P.subject.reference, P.id) 



define "Date of Donor Signature":
    Today()

define "Date of Release Signature":
    Today()



