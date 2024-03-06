Alias: $UCUM = http://unitsofmeasure.org
RuleSet: QuestionnaireItem(type, linkId, text)
* linkId = {linkId}
* text = {text}
* type = {type}
RuleSet: QuestionnaireItemRepeats(type, linkId, text)
* linkId = {linkId}
* text = {text}
* type = {type}
* repeats = true
RuleSet: QuestionnaireItemInitialExpression(expression)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
  * valueExpression
    * language = #text/cql-identifier
    * expression = {expression}
RuleSet: QuestionnaireItemUnit(code, display)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding
    * system = $UCUM
    * code = {code}
    * display = {display}
RuleSet: QuestionnaireEnableWhenEqualsCoding(question, coding)
* enableWhen[+]
  * question = {question}
  * operator = #=
  * answerCoding = {coding}
RuleSet: QuestionnaireUnitOption(code, display)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
  * valueCoding
    * system = $UCUM
    * code = {code}
    * display = {display}
RuleSet: QuestionnaireItemSignatureRequired(code, display)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-signatureRequired"
  * valueCoding
    * system = "urn:iso-astm:E1762-95:2013"
    * code = {code}
    * display = {display}
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-usageMode"
  * valueCode = #capture


Instance: BloodDonationQuestionnaire
InstanceOf: Questionnaire
Usage: #example
* url = "http://example.org/fhir/Questionnaire/BloodDonationQuestionnaire"
* name = "BloodDonationQuestionnaire"
* title = "Blood Donation Form"
* status = #active
* experimental = true
* date = "2024-03-01"
* publisher = "BIN Research Group"

* item[+]
  * insert QuestionnaireItem(#attachment, "conservenBarcode", "Konserven-Barcode")
* item[+]
  * insert QuestionnaireItem(#group, "personalInformation", "Persoenliche Informationen")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Title Familyname")
    * insert QuestionnaireItem(#string, "personalInformation|titleFamilyname", "Titel\, Familienname")
  * item[+]
    * insert QuestionnaireItemInitialExpression("First name")
    * insert QuestionnaireItem(#string, "personalInformation|firstname", "Vorname")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Street Number")
    * insert QuestionnaireItem(#string, "personalInformation|streetNumber", "Straße/Nr./Stiege/Tuer")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Postal Code")
    * insert QuestionnaireItem(#string, "personalInformation|postalCode", "PLZ")
  * item[+]
    * insert QuestionnaireItemInitialExpression("City")
    * insert QuestionnaireItem(#string, "personalInformation|city", "Ort")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Phone")
    * insert QuestionnaireItem(#string, "personalInformation|phone", "Telefon")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Email")
    * insert QuestionnaireItem(#string, "personalInformation|email", "E-Mail")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Previous Familyname")
    * insert QuestionnaireItem(#string, "personalInformation|previousFamilyname", "Frueherer Familienname")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Birthdate")
    * insert QuestionnaireItem(#date, "personalInformation|birthdate", "Geburtsdatum")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Gender")
    * insert QuestionnaireItem(#choice, "personalInformation|gender", "Geschlecht")
    * answerOption[+]
      * valueCoding.code = #female
      * valueCoding.display = "w"
    * answerOption[+]
      * valueCoding.code = #male
      * valueCoding.display = "m"
* item[+]
  * insert QuestionnaireItem(#group, "clinicalInformation", "Klinische Informationen")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Date")
    * insert QuestionnaireItem(#date, "clinicalInformation|date", "Datum")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Blood Pressure")
    * insert QuestionnaireItem(#string, "clinicalInformation|bloodPressure", "RR mmHg")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Pulse")
    * insert QuestionnaireItem(#string, "clinicalInformation|pulse", "Puls/min")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Temperature")
    * insert QuestionnaireItem(#decimal, "clinicalInformation|temperature", "Temp. °C")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Hemoglobin")
    * insert QuestionnaireItem(#decimal, "clinicalInformation|hemoglobin", "HB g/dl")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Photographic ID")
    * insert QuestionnaireItem(#string, "clinicalInformation|photographicId", "Lichtbildausweis")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Puncture")
    * insert QuestionnaireItem(#choice, "clinicalInformation|puncture", "Punktion")
    * answerOption[+]
      * valueCoding.code = #left
      * valueCoding.display = "links"
    * answerOption[+]
      * valueCoding.code = #right
      * valueCoding.display = "rechts"
  * item[+]
    * insert QuestionnaireItemInitialExpression("WNV Test")
    * insert QuestionnaireItem(#boolean, "clinicalInformation|wnvTest", "WNV-Test")
  * item[+]
    * insert QuestionnaireItemInitialExpression("No TK")
    * insert QuestionnaireItem(#boolean, "clinicalInformation|noTk", "Kein TK")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Remarks")
    * insert QuestionnaireItem(#string, "clinicalInformation|remarks", "Bemerkungen")

* item[+]
  * insert QuestionnaireItem(#group, "healthQuestions", "Gesundheitliche Fragen")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Do you feel healthy")
    * insert QuestionnaireItem(#choice, "healthQuestions|feelHealthy", "1. Fuehlen Sie sich gesund?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Weigh over 50kg")
    * insert QuestionnaireItem(#choice, "healthQuestions|weighOver50", "2. Wiegen Sie ueber 50 kg?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

    // Conditional item example
  * item[+]
    * insert QuestionnaireItemInitialExpression("Donated Blood Before")
    * insert QuestionnaireItem(#choice, "healthQuestions|donatedBlood", "3. Haben Sie schon einmal Blut\, Blutplaettchen oder Blutplasma oder Doppel-Erythrozyten gespendet?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|donatedBlood", #yes)
    * insert QuestionnaireItemInitialExpression("Last Blood Donation Date")
    * insert QuestionnaireItem(#date, "healthQuestions|lastBloodDonation", "3.a Wenn ja\, wann zuletzt?")
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|donatedBlood", #yes)
    * insert QuestionnaireItemInitialExpression("Last Blood Donation Reaction")
    * insert QuestionnaireItem(#choice, "healthQuestions|lastBloodDonationReaction", "3.b Wenn ja\, haben Sie diese bisherigen Spenden gut vertragen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("personalInformation|gender", #female)
    * insert QuestionnaireItemInitialExpression("Pregnancy in Last 6 Months")
    * insert QuestionnaireItem(#choice, "healthQuestions|pregnantLast6Months", "4. Weibliche Spender: Sind Sie oder waren Sie innerhalb der letzten 6 Monate schwanger oder stillen Sie?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|pregnantLast6Months", #yes)
    * insert QuestionnaireItemInitialExpression("End of last Pregnancy")
    * insert QuestionnaireItem(#date, "healthQuestions|pregnantUntil", "4.a Wenn ja\, bis wann waren Sie schwanger?")
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("personalInformation|gender", #female)
    * insert QuestionnaireItemInitialExpression("Given Birth")
    * insert QuestionnaireItem(#choice, "healthQuestions|givenBirth", "5. Weibliche Spender: Haben Sie jemals ein Kind geboren?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Currently in medical treatment or sick leave")
    * insert QuestionnaireItem(#choice, "healthQuestions|currentTreatmentSickLeave", "6. Sind Sie derzeit in aerztlicher Behandlung oder im Krankenstand oder auf Rehabilitation/Kur?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|currentTreatmentSickLeave", #yes)
    * insert QuestionnaireItemInitialExpression("Since when and why")
    * insert QuestionnaireItem(#string, "healthQuestions|treatmentSickLeaveDetails", "6.a Wenn ja\, seit wann und warum?")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Taking medication regularly")
    * insert QuestionnaireItem(#choice, "healthQuestions|regularMedication", "7.1 Nehmen Sie staendig Medikamente ein?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|regularMedication", #yes)
    * insert QuestionnaireItemInitialExpression("Which medications and when last taken?")
    * insert QuestionnaireItem(#string, "healthQuestions|regularMedicationDetails", "7.1a Welche und wann zuletzt?")

  * item[+]
    * insert QuestionnaireItemInitialExpression("Medication in the last 4 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|medicationLast4Weeks", "7.2 Haben Sie in den letzten 4 Wochen Medikamente (z.B. Schmerzmittel\, Antibiotika\, Hormone\) eingenommen oder Injektionen bekommen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|medicationLast4Weeks", #yes)
    * insert QuestionnaireItemInitialExpression("Which medications and when last taken")
    * insert QuestionnaireItem(#string, "healthQuestions|medicationLast4WeeksDetails", "7.2a Wenn ja\, welche und wann zuletzt?")

  * item[+]
    * insert QuestionnaireItemInitialExpression("Medication for acne in the last 12 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|acneMedicationLast12Months", "8.1 Haben Sie in den letzten 12 Monaten ein Medikament gegen Akne  (z.B. Isotretinoin\, Ciscutan...\) eingenommen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Medication to prevent a virus infection in the last 12 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|virsuMedicationLast12Months", "8.2 Haben Sie in den letzten 12 Monaten Medikamente\, die eine Virusinfektion ( z.B. mit HIV\) verhindern sollen\, eingenommen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Acitretin medication in the last 3 years")
    * insert QuestionnaireItem(#choice, "healthQuestions|acitretinMedicationLast3Years", "8.3 Haben Sie in den letzten 3 Jahren das Medikament Acitretin ( z.B. Neotigason\, Keracutan... \)wegen Hauterkrankungen eingenommen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Dental or minor surgical treatment in the last 4 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|recentDentalSurgicalTreatment", "9. Haben Sie sich in den letzten 4 Wochen einer zahnaerztlichen Behandlung oder einem kleineren chirurgischen Eingriff (z.B. Muttermal-Entfernung\) unterzogen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Vaccinated in the last 4 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|vaccinatedLast4Weeks", "10. Wurden Sie innerhalb der letzten 4 Wochen geimpft (auch Schluckimpfungen\)?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|vaccinatedLast4Weeks", #yes)
    * insert QuestionnaireItemInitialExpression("Which vaccinations within the last 4 weeks")
    * insert QuestionnaireItem(#string, "healthQuestions|vaccinationReason", "10.a Wenn ja\, wogegen?")

  * item[+] 
    * insert QuestionnaireItemInitialExpression("Received passive immunization in the last 12 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|passiveImmunizationLast12Months", "11. Haben Sie in den letzten 12 Monaten eine passive Impfung ( z.B. nach Tierbiss gegen Tollwut\) erhalten?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Misuse of alcohol medications or drugs")
    * insert QuestionnaireItem(#choice, "healthQuestions|alcoholMedicationMisuse", "12.1 Konsumieren Sie Drogen (auch Partydrogen wie Ecstasy\)? Verwenden Sie Alkohol oder Medikamente in missbraeuchlicher Weise?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Injected or snorted drugs")
    * insert QuestionnaireItem(#choice, "healthQuestions|injectedSnortedDrugs", "12.2 Haben Sie sich jemals Drogen gespritzt oder diese geschnupft?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Muscle building substances")
    * insert QuestionnaireItem(#choice, "healthQuestions|muscleBuildingSubstances", "13. Haben Sie sich jemals Praeparate fuer den Muskelaufbau gespritzt?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Current allergy or desensitization")
    * insert QuestionnaireItem(#choice, "healthQuestions|currentAllergyDesensitization", "15. Leiden Sie aktuell an einer Allergie oder lassen Sie derzeit eine Desensibilisierung durchfuehren?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Current skin inflammation")
    * insert QuestionnaireItem(#choice, "healthQuestions|skinInflammation", "16. Haben Sie derzeit entzuendliche offene Hautstellen oder Hautausschlag\, Fieberblasen\, Blaeschen im Mund oder an anderen Koerperstellen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Tick bite in last 8 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|tickBiteLast8Weeks", "17. Hatten Sie in den letzten 8 Wochen einen Zeckenstich?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Infection in last 4 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|infectionLast4Weeks", "18. Hatten Sie in den letzten 4 Wochen einen banalen Infekt (z.B. Husten\, Schnupfen\)\, einen fiebrhaften Infekt (Fieber ueber 38°C\) oder Durchfall oder Kontakt zu Personen mit Infektionskrankheiten (z.B. Grippe\, Masern\, Mumps...\)?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Tattooed or pierced in last 4 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|tattooedPiercedLast4Months", "19. Haben Sie sich in den letzten 4 Monaten taetowieren (auch Permanent Make up\)\, piercen\, ins Ohr stechen oder akupunktieren lassen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|tattooedPiercedLast4Months", #yes)
    * insert QuestionnaireItemInitialExpression("Tattoo or piercing at a medical facility")
    * insert QuestionnaireItem(#string, "healthQuestions|tattooPiercingMedicalFacility", "19.a Wenn ja\, war das in einer medizinischen Einrichtung?")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Contact with foreign blood")
    * insert QuestionnaireItem(#choice, "healthQuestions|foreignBloodContact", "20. Hatten Sie in den letzten 4 Monaten einen Kontakt mit Fremdblut?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

    
  * item[+]
    * insert QuestionnaireItemInitialExpression("Unexplained fever or lymph node swelling")
    * insert QuestionnaireItem(#choice, "healthQuestions|unexplainedFeverSwelling", "21. Hatten Sie in den letzten 4 Monaten unklare Fieber\, Lymphknotenschwellung\, Nachtschweiß oder unklaren Gewichtsverlust?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Hospital stay or medical treatment")
    * insert QuestionnaireItem(#choice, "healthQuestions|hospitalStayTreatment", "22. Waren Sie in den letzten 4 Monaten im Krankenhaus oder in einer medizinischen Einrichtung?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Contact with infectious diseases")
    * insert QuestionnaireItem(#choice, "healthQuestions|contactInfectiousDiseases", "23. Hatten Sie in den letzten 6 Monaten engen Kontakt zu Personen\, die an Hepatitis B\, Hepatitis C\, HIV\, Syphilis oder Tuberkulose leiden?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Heart or circulatory disease")
    * insert QuestionnaireItem(#choice, "healthQuestions|heartCirculatoryDisease", "24. Haben oder hatten Sie eine Herz-/Kreislaufkrankung(Bluthochdruck\, Herzschwäche\, Herzinfarkt\, Herzrhythmus- störungen\, Kollapsneigung\, Schlaganfall\, Durchblutungsstörungen\, Thrombosen\)?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Chronic illness")
    * insert QuestionnaireItem(#choice, "healthQuestions|chronicIllness", "25. Leiden oder litten Sie an einer chronischen Magen/Darmerkrankung\, Atemwegserkrankung\, Autoimmunerkrankung\, Blutgerinnungsstoerung\, Diabetes\, Epilepsie\, Krebs\, Nierenerkrankung\, Rheuma\, Osteomyelitis\, neurologische Erkrankung?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Blood products or coagulation factors")
    * insert QuestionnaireItem(#choice, "healthQuestions|bloodProductsCoagulationFactors", "26. Haben Sie jemals Blutkonserven und/oder Gerinnungsfaktoren erhalten?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|bloodProductsCoagulationFactors", #yes)
    * insert QuestionnaireItemInitialExpression("Blood products or coagulation factors reasons")
    * insert QuestionnaireItem(#string, "healthQuestions|bloodProductsCoagulationFactorsReasons", "26.a Wenn ja\, wann und warum?")


  * item[+]
    * insert QuestionnaireItemInitialExpression("Stay outside of Austria")
    * insert QuestionnaireItem(#choice, "healthQuestions|stayOutsideAustria", "27. Waren Sie in den letzten 6 Monaten außerhalb von oesterreich?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireEnableWhenEqualsCoding("healthQuestions|stayOutsideAustria", #yes)
    * insert QuestionnaireItemInitialExpression("Where outside Austria")
    * insert QuestionnaireItem(#string, "healthQuestions|whereOutsideAustria", "27.a Wenn ja\, wo?")

  * item[+]
    * insert QuestionnaireItemInitialExpression("Born or stayed outside of Europe")
    * insert QuestionnaireItem(#choice, "healthQuestions|bornStayedOutsideEurope", "28. Wurden Sie außerhalb von Europa geboren oder haben Sie sich jemals laenger als durchgehend 6 Monate außerhalb Europas aufgehalten?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Stay in West Nile Virus risk area")
    * insert QuestionnaireItem(#choice, "healthQuestions|westNileVirusRiskArea", "29. Waren Sie in den letzten 4 Wochen in einem Westnil-Virus-Infektionsgebiet wie z.B. in einem aktuellen europaeischen Risikogebiet oder USA\, Kanada?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Past Infections")
    * insert QuestionnaireItem(#choice, "healthQuestions|infectionLast4Months", "30. Hatten Sie eine der folgenden Infektionen: HIV\, Leberentzündung (Hepatitis\)\, Syphilis\, Chagas-Krankheit\, Dengue-Fieber\, Leishmaniose\, Lepra\, Babesiose\, HTLV-I/II\, Rickettsiose\, Schlafkrankheit\, Malaria oder andere?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Risk of tuberculosis or similar diseases")
    * insert QuestionnaireItem(#choice, "healthQuestions|tuberculosisRisk", "31. Waren Sie in den letzten 2 Jahren an Tuberkulose\, Q-Fieber\, Brucellose\, Borreliose oder in den letzten 6 Monaten an Toxoplasmose\, Mononukleose erkrankt?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Family history of prion disease")
    * insert QuestionnaireItem(#choice, "healthQuestions|prionDiseaseFamilyHistory", "32. Wurde bei Ihnen oder einem Familienangehoerigen jemals die Creutzfeldt-Jakob’sche Erkrankung oder eine andere von Prionen verursachte Erkrankung vermutet oder festgestellt?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Stay in the UK between 1980 and 1996")
    * insert QuestionnaireItem(#choice, "healthQuestions|ukStay1980To1996", "33. Haben Sie sich zwischen 1980 und 1996 insgesamt mehr als 6 Monate im Vereinigten Koenigreich Großbritannien und Nordirland aufgehalten?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Treatment with growth hormones before 1990")
    * insert QuestionnaireItem(#choice, "healthQuestions|growthHormoneTreatmentBefore1990", "34. Wurden Sie vor 1990 mit Wachstumshormonen oder einem anderen Hypophysenextrakt behandelt?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Undergone stereotactic surgery")
    * insert QuestionnaireItem(#choice, "healthQuestions|stereotacticSurgery", "35. Haben Sie sich einer stereotaktischen Operation (Gehirneingriff mittels Sonde\) unterzogen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Organ or tissue transplant")
    * insert QuestionnaireItem(#choice, "healthQuestions|organTissueTransplant", "36. Wurden Ihnen jemals Organe oder menschliches/tierisches Gewebe uebertragen (z.B. Hornhaut-\, Gehirnhauttransplantat\, Herzklappen\, Knochen\, Knorpel oder Frischzellen\)?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Sexual partner with sexually transmitted infection in last 4 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|stiPartnerLast4Months", "37. Hatten Sie in den letzten 4 Monaten eine/n Sexualpartner:in\, die/der an einer sexuell uebertragbaren Infektion erkrankt ist?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"


  * item[+]
    * insert QuestionnaireItemInitialExpression("More than 3 sexual partners in last 3 months")
    * insert QuestionnaireItem(#choice, "healthQuestions|multipleSexualPartnersLast3Months", "38. Hatten Sie in den letzten 3 Monaten mehr als 3 Sexualpartner:innen oder Sex mit einer Person\, bei der Sie wissen oder annehmen muessen\, dass diese in den letzten 3 Monaten mehr als 3 verschiedene Sexualpartner:innen hatte?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Unprotected sex with new partners in last 4 weeks")
    * insert QuestionnaireItem(#choice, "healthQuestions|unprotectedSexNewPartnersLast4Weeks", "39. Hatten Sie in den letzten 4 Wochen ungeschuetzten (auch einmaligen\) Sexualkontakt mit neuen Sexualpartner:innen?")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Agreement on blood and blood components")
    * insert QuestionnaireItem(#choice, "healthQuestions|agreementBloodComponents", "Ich bin damit einverstanden\, dass mir Blut und Blutbestandteile entnommen werden. Das Blut wird zur Herstellung von Blutprodukten verwendet und auf verschiedene Krankheiten und gesundheitsrelevante Blutwerte getestet.")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Consent to use residual blood for research")
    * insert QuestionnaireItem(#choice, "healthQuestions|consentUseResidualBloodResearch", "Restmaterial der Blutspende kann fuer wissenschaftliche Zwecke und zur Entwicklung neuer Testmethoden verwendet werden.")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"
  * item[+]
    * insert QuestionnaireItemInitialExpression("Awareness of potential infections and voluntary exclusion")
    * insert QuestionnaireItem(#choice, "consentQuestions|awarenessOfInfections", "Die Hinweise auf moegliche Infektionskrankheiten und den 'freiwilligen Selbstausschluss' habe ich erhalten\, gelesen und verstanden.")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Informed about donor risks")
    * insert QuestionnaireItem(#choice, "consentQuestions|informedAboutDonorRisks", "Ich bin ueber Spenderisiken im Rahmen der Blutspende aufgeklaert worden. Ich hatte Gelegenheit Fragen zu stellen und meine Fragen wurden zur Gaenze beantwortet.")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Consent to be informed about blood donation activities")
    * insert QuestionnaireItem(#choice, "consentQuestions|consentToBeInformed", "Ich stimme ausdruecklich zu\, dass das oesterreichische Rote Kreuz mich schriftlich\, telefonisch\, per SMS bzw. per E-Mail ueber Aktivitaeten im Zusammenhang mit Blutspendeaktionen informiert. Ich kann diese Zustimmung jederzeit per E-Mail an blutspendedienst@st.roteskreuz.at oder telefonisch unter 0800 190 190 widerrufen.")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

* item[+]
  * insert QuestionnaireItem(#group, "finalQuestions", "Ich habe alle Fragen nach bestem Wissen und Gewissen beantwortet.")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Date of Donor Signature")
    * insert QuestionnaireItem(#date, "finalQuestions|donorSignatureDate", "Datum / Unterschrift Spender:in")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Donor Signature")
    * insert QuestionnaireItem(#attachment, "finalQuestions|donorSignature", "Unterschrift Spender:in")
  * item[+]
    * insert QuestionnaireItemInitialExpression("Fit for donation")
    * insert QuestionnaireItem(#choice, "finalQuestions|fitForDonation", "Spendetauglich")
    * answerOption[+]
      * valueCoding.code = #yes
      * valueCoding.display = "Ja"
    * answerOption[+]
      * valueCoding.code = #no
      * valueCoding.display = "Nein"

  * item[+]
    * insert QuestionnaireItemInitialExpression("Date of Release Signature")
    * insert QuestionnaireItem(#date, "finalQuestions|releaseSignatureDate", "Datum / Unterschrift Freigabe")

  * item[+]
    * insert QuestionnaireItemInitialExpression("Release Signature")
    * insert QuestionnaireItem(#attachment, "finalQuestions|releaseSignature", "Unterschrift Freigabe")




