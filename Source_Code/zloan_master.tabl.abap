@EndUserText.label : 'Loan Approval Master'
@AbapCatalog.enhancement.category : #EXTENSIBLE_ANY
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zloan_master {

  key client      : abap.clnt not null;
  key loan_uuid   : sysuuid_x16 not null;
  customer_name   : abap.char(60);
  mobile          : abap.char(10);
  age             : abap.int4;
  salary          : abap.dec(15,2);
  cibil_score     : abap.int4;
  loan_amount     : abap.dec(15,2);
  loan_type       : abap.char(20);
  loan_status     : abap.char(20);
  remarks         : abap.char(100);
  created_by      : syuname;
  created_at      : timestampl;
  last_changed_by : syuname;
  last_changed_at : timestampl;

}
