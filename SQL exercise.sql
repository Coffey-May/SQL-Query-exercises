
--1.List each employee first name, last name and supervisor status along with their department name.
--Order by department name, then by employee last name, and finally by employee first name.

--SELECT e.Id, e.FirstName, e.LastName, e.DepartmentId, e.IsSupervisor FROM Employee e
--ORDER BY  e.FirstName

--2.List each department ordered by budget amount with the highest first.

--SELECT * FROM Department
--ORDER BY Budget DESC 

--3.List each department name along with any employees (full name) in that department who are supervisors.

--SELECT e.FirstName, e.LastName, d.[Name] AS DepartmentName, e.IsSupervisor
--FROM EMPLOYEE e
--LEFT JOIN Department d ON e.DepartmentId = d.Id
--WHERE e.IsSupervisor = 1

--4.List each department name along with a count of employees in each department.

--SELECT d.[Name] AS DepartmentName, COUNT(e.DepartmentId) AS EmployeeCount
--FROM EMPLOYEE e
--LEFT JOIN Department d ON e.DepartmentId =d.Id
--GROUP BY d.[Name]

--5.Write a single update statement to increase each department's budget by 20%.

--SELECT * FROM Department
--UPDATE Department
--SET Budget = (Budget * 1.20)

--6.List the employee full names for employees who are not signed up for any training programs.

--SELECT e.FirstName, e.LastName, et.EmployeeId, et.TrainingProgramId, t.[Name]
--FROM EMPLOYEE e
--LEFT JOIN  EmployeeTraining et ON e.Id = et.EmployeeId
--LEFT JOIN TrainingProgram t ON et.TrainingProgramId = t.Id
--WHERE et.TrainingProgramId is NULL


--7.List the employee full names for employees who are signed up for at least one training program 
--and include the number of training programs they are signed up for.

--SELECT e.FirstName, e.LastName, COUNT(et.TrainingProgramID) as TrainingCount
--FROM EMPLOYEE e
--LEFT JOIN  EmployeeTraining et ON e.Id = et.EmployeeId
--WHERE et.TrainingProgramId is NOT NULL
--GROUP BY e.FirstName, e.LastName

--8.List all training programs along with the count employees who have signed up for each.

--SELECT t.[Name], COUNT(et.EmployeeId) AS AttendeeCount
--FROM TrainingProgram t
--LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
--GROUP BY t.[Name]

--9.List all training programs who have no more seats available.

--SELECT t.[Name], t.MaxAttendees, COUNT(et.EmployeeId) AS AttendeeCount
--FROM TrainingProgram t
--LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
--GROUP BY t.[Name], t.MaxAttendees
--HAVING COUNT(et.EmployeeId) < t.MaxAttendees

--10.List all future training programs ordered by start date with the earliest date first.

--SELECT t.[Name], t.StartDate
--FROM TrainingProgram t
--ORDER BY t.StartDate ASC

--11.Assign a few employees to training programs of your choice.

--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
--OUTPUT INSERTED.Id
--VALUES (2, 12)

--12.List the top 3 most popular training programs. 
--(For this question, consider each record in the training program table to be a UNIQUE training program).

--SELECT TOP 3 t.[Name], t.[Id], COUNT(et.EmployeeId) AS AttendeeCount
--FROM TrainingProgram t
--LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
--GROUP BY t.[ID], t.[Name]
--ORDER BY AttendeeCount DESC

--13.List the top 3 most popular training programs. 
--(For this question consider training programs with the same name to be the SAME training program).

--SELECT TOP 3 t.[Name], COUNT(et.EmployeeId) AS AttendeeCount
--FROM TrainingProgram t
--LEFT JOIN EmployeeTraining et ON t.Id = et.TrainingProgramId
--GROUP BY t.[Name]
--ORDER BY AttendeeCount DESC

--14.List all employees who do not have computers.

--SELECT e.FirstName, e.LastName, ce.ComputerId
--FROM EMPLOYEE e
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--WHERE ce.ComputerId IS NULL

--15.List all employees along with their current computer information make and manufacturer combined
--into a field entitled ComputerInfo. If they do not have a computer, this field should say "N/A".

-- COALESCE IS ALSO the same as  ISNULL Here

--SELECT e.FirstName, e.LastName, ce.ComputerId, COALESCE(c.Manufacturer + ' ' + c.Make, 'N/A') AS ComputerInfo
--FROM EMPLOYEE e
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--LEFT JOIN Computer c ON ce.ComputerId = c.Id

--16.List all computers that were purchased before July 2019 that are have not been decommissioned.

--SELECT  c.Make, c.Manufacturer, c.PurchaseDate, c.DecomissionDate
--FROM COMPUTER c
--WHERE c.PurchaseDate < '20190701' AND c.DecomissionDate is NULL


--17.List all employees along with the total number of computers they have ever had.

--SELECT e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
--FROM Employee e 
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--LEFT JOIN Computer c ON ce.ComputerId = c.Id
--GROUP BY e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
--Having c.Make is NOT NULL

--18.List the number of customers using each payment type



--19.List the 10 most expensive products and the names of the seller
--20.List the 10 most purchased products and the names of the seller
--21.Find the name of the customer who has made the most purchases
--22.List the amount of total sales by product type
--23.List the total amount made from all sellers