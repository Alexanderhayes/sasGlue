%global CODE_PATH;
%let CODE_PATH=%str(D:\server\git_pulu\kalli\code\core\);
%include "&CODE_PATH.utili.sas";
options nosource;
%macro test_isEmpty;

	%local varname;

	%let varname=abC;
	%local &varname;
	%let &varname=%quote(content abc);
	%assertEqual(a=0,b=%isEmpty(&varname),msg=һ��ǿղ���);

	%let varname=;
	%assertEqual(a=1,b=%isEmpty(&varname),msg=varnameΪ�ղ���);

	%let varname=def;
	%assertEqual(a=1,b=%isEmpty(&varname),msg=����δ����);

	%let varname=def;
	%local &varname;
	%let &varname=;
	%assertEqual(a=1,b=%isEmpty(&varname),msg=����Ϊ�ղ���);

	%let varname=def;
	%local &varname;
	%let &varname=%quote(     );
	%assertEqual(a=0,b=%isEmpty(&varname),msg=����Ϊת��ո����);

%mend;
