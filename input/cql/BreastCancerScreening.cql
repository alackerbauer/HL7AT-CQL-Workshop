library BreastCancerScreening version '1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
codesystem "ICD10": 'http://hl7.org/fhir/sid/icd-10-cm'
code "Mammography": 'Z12.31' from "ICD10"

parameter "Measurement Period" default Interval[@1923-01-01T00:00:00.000, @2023-09-16T00:00:00.000]


context Patient

define "Info":
  'info'

define "Warning":
  'warning'

define "Critical":
  'critical'


define "Get Title":
  'Breast Cancer Screening Reminder'

define "Get Description":
  'According to national recommendations the patient should make an appointment for their regular breastcancer screening.'

define "Get Indicator":
  "Info"

define "Is Female":
  Patient.gender = 'female'

define "Between age 45 and 74":
    AgeInYears()in Interval[45,74]

define "Initial Population":
  "Is Female" and "Between age 45 and 74"

define "Denominator":
  "Initial Population"

define "Numerator":
  not exists([Encounter] E where 
  "Mammography" in E.reasonCode.coding
  and start of E.period in Interval[Today() - 2 years,Today()])

define "Qualifies for Breast Cancer Screening":
    "Initial Population" and "Numerator"