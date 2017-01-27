DECLARE
	v_proc_prod_id NUMBER;
	v_dp_prod_id   NUMBER;
BEGIN
	-- Insert a sample Process Product
	select seq_prod_id.nextval into v_proc_prod_id from dual;
	insert into tproduct values (
		v_proc_prod_id,
		'P',
		NULL
	);
	insert into tproduct_config values (
		seq_prod_id.currval,
		'<productConfig><lob>Property</lob><wfType>Lean</wfType><region>APAC</region></productConfig>'
	);

	-- Insert a sample Data Point Product
	select seq_prod_id.nextval into v_dp_prod_id from dual;
	insert into tproduct values (
		v_dp_prod_id,
		'D',
		'Mexico Fire Liability and Others'
	);
	insert into tproduct_config values (
		seq_prod_id.currval,
		'<productConfig><businessConfig><lob>Property</lob><lob>Casualty</lob><country>MEX</country></businessConfig></productConfig>'
	);

END;
