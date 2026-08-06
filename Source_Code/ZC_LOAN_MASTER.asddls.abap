@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Loan Master Projection'
@Metadata.allowExtensions: true

define root view entity ZC_LOAN_MASTER
  provider contract transactional_query
  as projection on ZI_LOAN_MASTER
{
  key LoanUUID,
      CustomerName,
      Mobile,
      Age,
      Salary,
      CIBILScore,
      LoanAmount,
      LoanType,
      LoanStatus,
      Remarks,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
