@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Loan Master Interface'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_LOAN_MASTER
  as select from zloan_master
{
  key loan_uuid       as LoanUUID,
      customer_name   as CustomerName,
      mobile          as Mobile,
      age             as Age,
      salary          as Salary,
      cibil_score     as CIBILScore,
      loan_amount     as LoanAmount,
      loan_type       as LoanType,
      loan_status     as LoanStatus,
      remarks         as Remarks,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt
}
