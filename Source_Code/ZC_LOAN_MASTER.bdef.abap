projection;
strict ( 2 );
use draft;

define behavior for ZC_LOAN_MASTER alias LoanMaster
{
  use create;
  use update;
  use delete;

  use action CheckEligibility;

  use action Edit;
  use action Activate;
  use action Discard;
  use action Resume;
  use action Prepare;
}
