--SELECT Appointment.ExaminationRoom, COUNT(*) AS 'Count' FROM Appointment WHERE ExaminationRoom='A' AND MONTH(StartA)=4 GROUP BY ExaminationRoom

--SELECT Stay.Room, COUNT(*) AS 'Count' FROM Stay GROUP BY Room HAVING COUNT(*)=1;


--SELECT Patient.SSN, Patient.Name, Stay.StayID FROM Patient INNER JOIN Stay ON Patient.SSN = Stay.Patient;

--ให้แสดงชื่อพยาบาลที่เข้าเวรในวันที่ 4 พย 2018
--SELECT distinct Nurse.Name FROM On_Call INNER JOIN Nurse ON Nurse.EmployeeID=On_Call.Nurse WHERE YEAR(StartO)=2018 AND MONTH(StartO)=11 AND DAY(StartO)=4 ;

SELECT Nurse.Name FROM Nurse WHERE Nurse.EmployeeID IN (SELECT On_Call.Nurse FROM On_Call WHERE YEAR(StartO)=2018 AND MONTH(StartO)=11 AND DAY(StartO)=4 )  ;
