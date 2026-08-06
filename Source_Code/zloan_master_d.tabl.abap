@EndUserText.label : 'Draft table for entity ZI_LOAN_MASTER'
@AbapCatalog.enhancement.category : #EXTENSIBLE_ANY
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zloan_master_d {

  key mandt     : mandt not null;
  key loanuuid  : sysuuid_x16 not null;
  customername  : abap.char(60);
  mobile        : abap.char(10);
  age           : abap.int4;
  salary        : abap.dec(15,2);
  cibilscore    : abap.int4;
  loanamount    : abap.dec(15,2);
  loantype      : abap.char(20);
  loanstatus    : abap.char(20);
  remarks       : abap.char(100);
  createdby     : syuname;
  createdat     : timestampl;
  lastchangedby : syuname;
  lastchangedat : timestampl;
  "%admin"      : include sych_bdl_draft_admin_inc;

}
