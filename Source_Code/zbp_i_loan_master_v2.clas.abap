CLASS lhc_ZI_LOAN_MASTER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR LoanMaster RESULT result.

    METHODS CheckEligibility FOR MODIFY
      IMPORTING keys FOR ACTION LoanMaster~CheckEligibility RESULT result.

    METHODS SetLoanDetails FOR DETERMINE ON MODIFY
      IMPORTING keys FOR LoanMaster~SetLoanDetails.

    METHODS ValidateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR LoanMaster~ValidateAge.

    METHODS ValidateCIBIL FOR VALIDATE ON SAVE
      IMPORTING keys FOR LoanMaster~ValidateCIBIL.

    METHODS ValidateMobile FOR VALIDATE ON SAVE
      IMPORTING keys FOR LoanMaster~ValidateMobile.

    METHODS ValidateSalary FOR VALIDATE ON SAVE
      IMPORTING keys FOR LoanMaster~ValidateSalary.

ENDCLASS.

CLASS lhc_ZI_LOAN_MASTER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD SetLoanDetails.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      FIELDS ( LoanStatus ) WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    MODIFY ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      UPDATE FIELDS ( LoanStatus Remarks )
      WITH VALUE #( FOR loan IN loans WHERE ( LoanStatus IS INITIAL ) (
        %tky       = loan-%tky
        LoanStatus = 'NEW'
        Remarks    = 'Application Created'
      ) ).
  ENDMETHOD.

  METHOD CheckEligibility.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    LOOP AT loans ASSIGNING FIELD-SYMBOL(<loan>).
      IF <loan>-CIBILScore >= 750 AND <loan>-Salary >= 25000.
        <loan>-LoanStatus = 'APPROVED'.
        <loan>-Remarks    = 'Eligible: High CIBIL & Stable Income'.
      ELSEIF <loan>-CIBILScore >= 650 AND <loan>-Salary >= 20000.
        <loan>-LoanStatus = 'PENDING MANUAL REVIEW'.
        <loan>-Remarks    = 'Moderate Risk: Requires Manual Approval'.
      ELSE.
        <loan>-LoanStatus = 'REJECTED'.
        <loan>-Remarks    = 'Low CIBIL Score or Insufficient Income'.
      ENDIF.

      MODIFY ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
        ENTITY LoanMaster
        UPDATE FIELDS ( LoanStatus Remarks )
        WITH VALUE #( (
          %tky       = <loan>-%tky
          LoanStatus = <loan>-LoanStatus
          Remarks    = <loan>-Remarks
        ) ).
    ENDLOOP.

    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(updated_loans).

    result = VALUE #( FOR loan IN updated_loans ( %tky = loan-%tky %param = loan ) ).
  ENDMETHOD.

  METHOD ValidateAge.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      FIELDS ( Age ) WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    LOOP AT loans INTO DATA(loan).
      IF loan-Age < 21 OR loan-Age > 65.
        APPEND VALUE #( %tky = loan-%tky ) TO failed-loanmaster.
        APPEND VALUE #(
          %tky = loan-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'Applicant age must be between 21 and 65 years.'
                 )
          %element-Age = if_abap_behv=>mk-on
        ) TO reported-loanmaster.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD ValidateCIBIL.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      FIELDS ( CIBILScore ) WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    LOOP AT loans INTO DATA(loan).
      IF loan-CIBILScore < 300 OR loan-CIBILScore > 900.
        APPEND VALUE #( %tky = loan-%tky ) TO failed-loanmaster.
        APPEND VALUE #(
          %tky = loan-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'CIBIL Score must be between 300 and 900.'
                 )
          %element-CIBILScore = if_abap_behv=>mk-on
        ) TO reported-loanmaster.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD ValidateMobile.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      FIELDS ( Mobile ) WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    LOOP AT loans INTO DATA(loan).
      IF strlen( loan-Mobile ) <> 10 OR loan-Mobile CN '0123456789'.
        APPEND VALUE #( %tky = loan-%tky ) TO failed-loanmaster.
        APPEND VALUE #(
          %tky = loan-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'Mobile number must contain exactly 10 digits.'
                 )
          %element-Mobile = if_abap_behv=>mk-on
        ) TO reported-loanmaster.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD ValidateSalary.
    READ ENTITIES OF ZI_LOAN_MASTER IN LOCAL MODE
      ENTITY LoanMaster
      FIELDS ( Salary ) WITH CORRESPONDING #( keys )
      RESULT DATA(loans).

    LOOP AT loans INTO DATA(loan).
      IF loan-Salary <= 0.
        APPEND VALUE #( %tky = loan-%tky ) TO failed-loanmaster.
        APPEND VALUE #(
          %tky = loan-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'Salary must be greater than zero.'
                 )
          %element-Salary = if_abap_behv=>mk-on
        ) TO reported-loanmaster.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
