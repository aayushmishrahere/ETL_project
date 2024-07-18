
-- 1. WHAT IS THE AVERAGE LOAN AMOUNT FOR BORROWERS WHO ARE MORE THAN 5 DAYS PAST DUE

-- Displaying the Average loan amount by checking the delayed payment as yes and
-- due payment more than 5 days
Select avg(`Loan Amount`) As average_loan_amount
From borrowers
Where `Delayed Payment` = 'Yes'
	And `Due Payment` > 5;
    
    

-- 2. WHO ARE THE TOP 10 BORROWERS WITH THE HIGHEST OUTSTANDING BALANCE

-- Calculating the outstanding amount by firstly adding the principal amount and the Simple Interest
-- then Subtracting the multiplication of EMI and the number of times it has been payed 
--  and also checking if the number of payments is zero then just subtracting the EMI
Select `Name`, `Email Address`, `Geographical Location`,
(`Loan Amount` + (`Loan Amount` * `Interest Rate`) - 
(Case When `Number of Payments` > 0 Then (`EMI` * `Number of Payments`) 
Else `EMI` END)) As Outstanding_Balance
From borrowers
order by Outstanding_Balance Desc
LIMIT 10;



-- 3. LIST OF ALL THE BORROWERS WITH GOOD REPAYMENT HISTORY

-- Creating a CTE to take out Average Loan Term
With Average_Loan_Term As(
	 Select avg(`Loan Term`) as AvgLoanTerm
     from borrowers
)
-- Checking if the Number of times EMI is given is more than Average Loan term
-- and also checking there is no delayed payments to determine good repayment history
Select `Name`, `Credit Score`,`Number of Payments`,`Loan Term`
from borrowers, Average_Loan_Term
Where `Number of Payments` > Average_Loan_Term.AvgLoanTerm
	And `Delayed Payment` = 'No';
    


-- 4. BRIEF ANALYSIS WITH RESPECT TO LOAN TYPE

-- Creating CTE to take out Average Loan term
With Average_Loan_Term As(
	 Select avg(`Loan Term`) as AvgLoanTerm
     from borrowers
),
-- Creating 2nd CTE to Calculated distinct Loan Type Borrowers and Also Sum the Borrowers 
-- Who have given the EMI mor than the Average Loan Term to determine Good Borrower
Repayment_History As(
	Select `Loan Type`, Count(*) As Total_Borrowers,
    Sum(Case When `Number of Payments` > (Select AvgLoanTerm from Average_Loan_Term )
		Then 1 Else 0 End) As Good_Borrowers
	from borrowers
    Group by `Loan Type`
)
-- Here Showing all the loan type, its Total number of Borrowers, Number of Good Borrowers
-- and there percentage according to the total borrowers
Select `Loan Type`, Total_Borrowers, Good_Borrowers,
		(Good_Borrowers/Total_Borrowers) * 100 As Good_Borrowers_Percentage
From Repayment_History;
