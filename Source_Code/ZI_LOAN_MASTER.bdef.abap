managed implementation in class zbp_i_loan_master_v2 unique;
strict ( 2 );
with draft;

define behavior for ZI_LOAN_MASTER alias LoanMaster
persistent table zloan_master
draft table zloan_master_d
lock master total etag LastChangedAt
authorization master ( instance )
etag master LastChangedAt
{
  create;
  update;
  delete;

  draft action Edit;
  draft action Activate ;
  draft action Discard;
  draft action Resume;
  draft determine action Prepare;

  action CheckEligibility result [1] $self;

  field ( readonly, numbering : managed ) LoanUUID;

  field ( readonly )
    LoanStatus,
    Remarks,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt;

  field ( mandatory )
    CustomerName,
    Mobile,
    Age,
    Salary,
    CIBILScore,
    LoanAmount,
    LoanType;

  determination SetLoanDetails on modify { create; }

  validation ValidateAge on save { create; update; }
  validation ValidateMobile on save { create; update; }
  validation ValidateSalary on save { create; update; }
  validation ValidateCIBIL on save { create; update; }

  mapping for zloan_master
  {
    LoanUUID       = loan_uuid;
    CustomerName   = customer_name;
    Mobile         = mobile;
    Age            = age;
    Salary         = salary;
    CIBILScore     = cibil_score;
    LoanAmount     = loan_amount;
    LoanType       = loan_type;
    LoanStatus     = loan_status;
    Remarks        = remarks;
    CreatedBy      = created_by;
    CreatedAt      = created_at;
    LastChangedBy  = last_changed_by;
    LastChangedAt  = last_changed_at;
  }
}
