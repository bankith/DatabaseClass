

--จงเขียนคำสั่ง SQL เพื่อนับจำนวนพยาบาลที่เข้าเวรในวันที่ 4 พฤศจิกายน 2018 *
--SELECT COUNT(*) FROM On_Call WHERE YEAR(StartO)=2018 AND MONTH(StartO)=11 AND DAY(StartO)=4;

--จงเขียนคำสั่ง SQL เพื่อนับจำนวนการเข้าเวรของพยาบาลแต่ละคนทุกคน โดยแสดงชื่อของพยาบาลด้วย
--SELECT  Nurse.Name, COUNT(*) AS 'On Call Count' FROM On_Call INNER JOIN Nurse ON On_Call.Nurse=Nurse.EmployeeID GROUP BY Nurse.Name;

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อพยาบาลที่เข้าเวรในวันที่ 4 พฤศจิกายน 2018 *
--SELECT  Nurse.Name FROM On_Call INNER JOIN Nurse ON On_Call.Nurse=Nurse.EmployeeID  WHERE YEAR(StartO)=2018 AND MONTH(StartO)=11 AND DAY(StartO)=4;

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อพยาบาลและวันที่ขึ้นเวรของพยาบาลที่รับผิดชอบชั้น 1 *
--SELECT  Nurse.Name, On_Call.StartO FROM On_Call INNER JOIN Nurse ON On_Call.Nurse=Nurse.EmployeeID WHERE On_Call.BlockFloor=1;

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อ และจำนวนการเข้าเวรของพยาบาลแต่ละคน โดยแสดงเฉพาะคนที่เข้าเวรตั้งแต่ 2 ครั้งขึ้นไป *
--SELECT  Nurse.Name, COUNT(*) AS 'On Call Count' FROM On_Call INNER JOIN Nurse ON On_Call.Nurse=Nurse.EmployeeID 
--													GROUP BY Nurse.Name HAVING COUNT(*)>=2;



-- แพทย์

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อแพทย์ที่เคยสังกัดแผนกมากกว่า 1 แผนก *
--SELECT * FROM Physician INNER JOIN Affiliated_With ON Physician.EmployeeID=Affiliated_With.Physician ORDER BY Physician.Name;
--SELECT Physician.Name FROM Physician INNER JOIN Affiliated_With ON Physician.EmployeeID=Affiliated_With.Physician GROUP BY Physician.Name HAVING COUNT(*)>=2;


--จงเขียนคำสั่ง SQL เพื่อนับจำนวนแพทย์ที่อยู่แต่ละแผนก โดยแสดงชื่อของแผนกแต่ละแผนกด้วย
--SELECT Department.Name, COUNT(*) AS 'Physician count'  FROM ( (Affiliated_With INNER JOIN Physician ON Physician.EmployeeID=Affiliated_With.Physician )
--						   INNER JOIN Department ON Department.DepartmentID=Affiliated_With.Department ) GROUP BY Department.Name


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อแพทย์ที่เป็นหัวหน้าแผนกของแต่ละแผนก โดยแสดงชื่อของแผนกแต่ละแผนกด้วย *
--SELECT Physician.Name, Department.Name FROM Department LEFT JOIN Physician ON Physician.EmployeeID=Department.Head
						   
--จงเขียนคำสั่ง SQL เพื่อแสดงรายละเอียดของแพทย์พร้อมแสดงชื่อแผนกที่แพทย์แต่ละคนสังกัดอยู่ในปัจจุบัน *
--SELECT Physician.Name, Physician.Position, Physician.EmployeeID, Physician.SSN, Department.Name AS 'Department'  FROM ( (Affiliated_With INNER JOIN Physician ON Physician.EmployeeID=Affiliated_With.Physician )
--						   INNER JOIN Department ON Department.DepartmentID=Affiliated_With.Department ) WHERE Affiliated_With.PrimaryAffiliation=1



--การอบรม

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อแพทย์ และการอบรมของแพทย์แต่ละคน โดยแสดงของแพทย์ทุกคน เรียงตามชื่อแพทย์ *
--SELECT Physician.Name, Trained_In.Treatment FROM Trained_In JOIN Physician ON Trained_In.Physician=Physician.EmployeeID ORDER BY Physician.Name

--จงเขียนคำสั่ง SQL เพื่อแสดงรายชื่อการอบรมและชื่อแพทย์ที่เข้าอบรมแต่ละการอบรม เรียงลำดับตามชื่อการอบรม *
--SELECT Procedures.Name, Physician.Name FROM (( Trained_In JOIN Physician ON Trained_In.Physician=Physician.EmployeeID ) 
--																JOIN Procedures ON Procedures.Code=Trained_In.Treatment) ORDER BY Procedures.Name

--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อแพทย์ และจำนวนครั้งการอบรมของแพทย์แต่ละคน โดยแสดงของแพทย์ทุกคน เรียงตามชื่อแพทย์ *
--SELECT Physician.Name, COUNT(*) AS 'training count'  FROM Trained_In JOIN Physician ON Trained_In.Physician=Physician.EmployeeID GROUP BY Physician.Name ORDER BY Physician.Name



--ผู้ป่วย


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อผู้ป่วย และจำนวนห้องที่ผู้ป่วยเคยได้รับการรักษา โดยแสดงชื่อผู้ป่วยในระบบทุกคน *

--****SELECT Patient.Name,COUNT(*) AS 'room count' FROM Patient LEFT JOIN Stay ON Patient.SSN=Stay.Patient GROUP BY Patient.Name


--จงเขียนคำสั่ง SQL เพื่อแสดงหมายเลขประจำตัวของผู้ป่วย และชื่อผู้ป่วยที่มีการพบแพทย์เพียงครั้งเดียว โดยแสดงชื่อแพทย์ที่ผู้ป่วยมาพบด้วย เรียงลำดับตามหมายเลขประจำตัวผู้ป่วย *
--SELECT * FROM Patient JOIN Appointment ON Appointment.Patient=Patient.SSN ORDER BY Patient.SSN ;

--SELECT Patient.Name FROM Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN GROUP BY Patient.Name HAVING COUNT(*)=1

--SELECT Patient.SSN, Patient.Name, Physician.Name FROM ((Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN)
--						INNER JOIN Physician ON Physician.EmployeeID=Appointment.Physician) WHERE Patient.Name 
--						IN (SELECT Patient.Name FROM Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN GROUP BY Patient.Name HAVING COUNT(*)=1
--) ORDER BY Patient.SSN


--จงเขียนคำสั่ง SQL เพื่อนับจำนวนการนัดพบแพทย์ของผู้ป่วยแต่ละคน โดยแสดงหมายเลขประจำตัวของผู้ป่วย และชื่อผู้ป่วยด้วย *
--SELECT Patient.InsuranceID, Patient.Name, COUNT(*) AS 'พบแพทย์ครั้ง'  FROM Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN GROUP BY Patient.Name, Patient.InsuranceID


--จงเขียนคำสั่ง SQL เพื่อแสดงขื่อผู้ป่วย ชื่อแพทย์ และวันที่นัดรักษา เฉพาะที่ไม่มีพยาบาลเป็นผู้นัดหมาย *
--SELECT Patient.Name, Physician.Name, Appointment.StartA FROM ((Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN)
--						INNER JOIN Physician ON Appointment.Physician=Physician.EmployeeID) WHERE Appointment.PrepNurse IS NULL


--จงเขียนคำสั่ง SQL เพื่อแสดงรายละเอียดการนัดในวันที่ 24 เมษายน 2018 ของห้องตรวจ A โดยแสดงชื่อผู้ป่วย ชื่อแพทย์ ชื่อพยาบาลด้วย *
--SELECT Patient.Name, Physician.Name, Nurse.Name FROM (((Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN)
--						INNER JOIN Physician ON Appointment.Physician=Physician.EmployeeID)
--						INNER JOIN Nurse ON Appointment.PrepNurse=Nurse.EmployeeID) 
--						WHERE YEAR(Appointment.StartA)=2018 AND MONTH( Appointment.StartA)=4 AND DAY( Appointment.StartA)=24;

--จงเขียนคำสั่ง SQL เพื่อแสดงหมายเลขประจำตัวของผู้ป่วย ชื่อผู้ป่วย ชื่อแพทย์ ที่มีการนัดพบในเดือนเมษายน 2018 เรียงตามเวลานัดพบ *
--SELECT Patient.InsuranceID,Patient.Name, Physician.Name FROM ((Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN)
--						INNER JOIN Physician ON Appointment.Physician=Physician.EmployeeID)					 
--						WHERE YEAR(Appointment.StartA)=2018 AND MONTH( Appointment.StartA)=4 
--						ORDER BY Appointment.StartA;



--จงเขียนคำสั่ง SQL เพื่อแสดงหมายเลขประจำตัวของผู้ป่วย ชื่อผู้ป่วย ที่มีการพักรักษาตัวที่โรงพยาบาลในวันที่ 16 มิถุนายน 2018 *
--SELECT Patient.InsuranceID,Patient.Name FROM (Patient INNER JOIN Appointment ON Appointment.Patient=Patient.SSN)									 
--						WHERE YEAR(Appointment.StartA)=2018 AND MONTH( Appointment.StartA)=6 AND DAY(Appointment.StartA)=16 
						



--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อของผู้ป่วยที่พักที่โรงพยาบาล และค่ารักษาพยาบาลรวม *
--SELECT Patient.Name, SUM(Procedures.Cost) FROM Patient INNER JOIN Undergoes ON Undergoes.Patient=Patient.SSN
--						JOIN Procedures ON Undergoes.Procedures=Procedures.Code 
--						GROUP BY Patient.Name;


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อของผู้ป่วยที่พักที่โรงพยาบาล ค่ารักษาพยาบาล และวันที่ทำการรักษา เฉพาะครั้งที่ค่ารักษาเกิน 5000 บาท *
--SELECT Patient.Name, Procedures.Cost, Undergoes.Date FROM Patient INNER JOIN Undergoes ON Undergoes.Patient=Patient.SSN
--						JOIN Procedures ON Undergoes.Procedures=Procedures.Code 
--						WHERE Procedures.Cost>5000







--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อพยาบาลที่เคยดูแลห้อง 123 โดยใช้การ Join ตาราง *
--SELECT Nurse.Name FROM On_Call JOIN Nurse ON Nurse.EmployeeID=On_Call.Nurse
--					   JOIN Room ON Room.BlockCode=On_Call.BlockCode AND Room.BlockFloor=On_Call.BlockFloor
--					   WHERE Room.Number=123;


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อพยาบาลที่เคยดูแลห้อง 123 โดยใช้ Subquery *
--SELECT Nurse.Name FROM Nurse WHERE Nurse.Name IN (SELECT Nurse.Name FROM On_Call JOIN Nurse ON Nurse.EmployeeID=On_Call.Nurse
--					   JOIN Room ON Room.BlockCode=On_Call.BlockCode AND Room.BlockFloor=On_Call.BlockFloor
--					   WHERE Room.Number=123);


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อของผู้ป่วยและชื่อยาที่ได้รับ พร้อมปริมาณ และชื่อแพทย์ผู้จ่ายยา *
--SELECT Patient.Name, Prescribes.Medication, Prescribes.Dose, Physician.Name FROM Prescribes INNER JOIN Patient ON Prescribes.Patient=Patient.SSN
--						 INNER JOIN Physician ON Prescribes.Physician=Physician.EmployeeID


--จงเขียนคำสั่ง SQL เพื่อแสดงชื่อของผู้ป่วยที่พักที่โรงพยาบาล และค่ารักษาพยาบาลรวม โดยแสดงเฉพาะที่ค่ารักษารวมเกิน 5000 บาท *
--SELECT Patient.Name, SUM(Procedures.Cost) FROM Patient INNER JOIN Undergoes ON Undergoes.Patient=Patient.SSN
--						JOIN Procedures ON Undergoes.Procedures=Procedures.Code 
--						GROUP BY Patient.Name
--						Having SUM(Procedures.Cost)>5000