options nonotes;
%include 'D:\server\git_pulu\kalli\code\core\utili.sas';

%macro test_getAssignVar;
  %local d;

  %let d=�Ⱥ���߲�Ϊ��;
  %let a=%quote(A='abc');
  %let r=%getAssignVar(&a.);
  %put &r.;

  %let d=�Ⱥ���߲�Ϊ��;
  %let a=%quote(A='abc'=b);
  %let r=%getAssignVar(&a.);
  %put &r.;

  %let d=�Ⱥ���ߵȺŴ�Ϊ��;
  %let a=%quote( ='abc');
  %let r=%getAssignVar(&a.);
  %put &r.;

  %let d=�Ⱥ���߲�Ϊ�գ����ж���Ⱥ�ʽ;
  %let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
  %let r=%getAssignVar(&a.);
  %put &r.;

  %let d=Ϊ��;
  %let a= ;
  %let r=%getAssignVar(&a.);
  %put &r.;
%mend;

%macro test_getAssignValue;
  	%local d;

  	%let d=�Ⱥ���߲�Ϊ��;
  	%let a=%quote(A='abc');
  	%let r=%getAssignValue(&a.);
  	%put &r.;

  	%let d=�Ⱥ���߲�Ϊ��;
 	%let a=%quote(A='abc'=b);
  	%let r=%getAssignValue(&a.);
  	%put &r.;

  	%let d=�Ⱥ���ߵȺŴ�Ϊ��;
  	%let a=%quote( ='abc');
  	%let r=%getAssignValue(&a.);
  	%put &r.;

  	%let d=�Ⱥ���߲�Ϊ�գ����ж���Ⱥ�ʽ;
  	%let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
  	%let r=%getAssignValue(&a.);
  	%put &r.;

	%let d=Ϊ��;
  	%let a=%quote(a=);
  	%let r=%getAssignValue(&a.);
  	%put &r.;

  	%let d=Ϊ��;
  	%let a= ;
  	%let r=%getAssignValue(&a.);
  	%put &r.;
%mend;


%macro test_assignsFilter;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local d a v r;

	%let d=������ �����ִ�Сд;
	%let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
	%let v=A D;
	%assignsFilter(assigns=&a,vars=&v,isBlacklist=0,res=&tres);%let r=&&&tres;
	%put &d;
	%put a=&a;
	%put v=&v;
	%put r=&r;

	%let d=������ ���ִ�Сд;
	%let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
	%let v=A D;
	%assignsFilter(assigns=&a,vars=&v,caseSensitive=1,isBlacklist=0,res=&tres);%let r=&&&tres;
	%put &d;
	%put a=&a;
	%put v=&v;
	%put r=&r;

	%let d=������ �����ִ�Сд;
	%let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
	%let v=A D;
	%assignsFilter(assigns=&a,vars=&v,caseSensitive=0,res=&tres);%let r=&&&tres;
	%put &d;
	%put a=&a;
	%put v=&v;
	%put r=&r;

	%let d=������ ���ִ�Сд;
	%let a=%quote(A='abc' B=123.234 C='dfoef����' d=sdfwefwef D=111111);
	%let v=A D;
	%assignsFilter(assigns=&a,vars=&v,caseSensitive=1,res=&tres);%let r=&&&tres;
	%put &d;
	%put a=&a;
	%put v=&v;
	%put r=&r;
%mend;

%macro test_assignsSuffix;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r;

	%let d=��������;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let prefix=PA_;
	%let suffix=_SX;
	%assignsSuffix(assigns=&a,prefix=&prefix,suffix=&suffix,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;

	%let d=�������� - ����׺;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let prefix=PA_;
	%let suffix=_SX;
	%assignsSuffix(assigns=&a,suffix=&suffix,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;

	%let d=�������� - ��ǰ׺;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let prefix=PA_;
	%let suffix=_SX;
	%assignsSuffix(assigns=&a,prefix=&prefix,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;

	%let d=��������;
	%let a=%quote(char1='Z' char2=0);
	%let prefix=PA_;
	%let suffix=_SX;
	%assignsSuffix(assigns=&a,prefix=&prefix,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;
%mend;

%macro test_assignsSuffix_p1;
	
	%local a;
	%let a=%quote(char1='Z' char2=0);
	%test_assignsSuffix_p2(a=&a);
%mend;

%macro test_assignsSuffix_p2(a=);
	%local tres;%let tres=%createTempVar;%local &tres;
	%local r;
	%assignsSuffix(assigns=&a,prefix=P_,res=&tres);%let r=&&&tres;
	%put result=&r;

%mend;


%macro test_assignsFind;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r;

	%let d=��������;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let var=a;
	%assignsFind(assigns=&a,var=&var,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;

	%let d=��������;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let var=C;
	%assignsFind(assigns=&a,var=&var,res=&tres);%let r=&&&tres;
	%put &d;
	%put r=&r;

	%let d=�������� ���ִ�Сд;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let var=a;
	%assignsFind(assigns=&a,var=&var,res=&tres,caseSensitive=1);%let r=&&&tres;
	%put &d;
	%put r=&r;

%mend;


%macro test_assignsVars;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r e;

	%let d=��������;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let e=A B C d D;
	%let cmd=%nrquote(%assignsVars(assigns=&a,res=&tres))
	%unquote(&cmd);
	%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);

	%let d=��������;
	%let a=%quote( );
	%let e=;
	%let cmd=%nrquote(%assignsVars(assigns=&a,res=&tres))
	%unquote(&cmd);
	%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);
	
%mend;

%macro test_assignsValues;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r e;

	%let d=��������;
	%let a=%quote(A='abc' B=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let e='abc' 123.234 'ABC����' ABCDFGH 111111;
	%assignsValues(assigns=&a,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e);

	%let d=��������;
	%let a=%quote( );
	%let e=;
	%assignsValues(assigns=&a,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e);
	
%mend;



%macro test_assignsUpcase;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r e;

	%let d=��������;
	%let a=%quote(a='abc' b=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let e=%quote(A='abc' B=123.234 C='ABC����' D=ABCDFGH D=111111);
	%assignsUpcase(assigns=&a,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);
	
%mend;

%macro test_assignsEqual;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a b r e;

	%let d=�������� �����ִ�Сд;
	%let a=%quote(a='abc' b=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let b=%quote(A='abc' B=123.234 C='ABC����' D=ABCDFGH D=111111);
	%let e=1;
	%assignsEqual(a=&a,b=&b,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);
	
	%let d=�������� �����ִ�Сд;
	%let a=%quote(a='abc' b=123.234 C='ABC����' D=111111 D=111111);
	%let b=%quote(A='abc' B=123.234 C='ABC����' D=111111);
	%let e=0;
	%assignsEqual(a=&a,b=&b,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);

	%let d=�������� ���ִ�Сд;
	%let a=%quote(a='abc' b=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let b=%quote(A='abc' B=123.234 C='ABC����' D=ABCDFGH D=111111);
	%let e=0;
	%assignsEqual(a=&a,b=&b,caseSensitive=1,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);
	
%mend;

%macro test_assignsJoin;

	%local tres;%let tres=%createTempVar;%local &tres;
	%local d a b e r;
	
	%let d=�������� �����ִ�Сд;
	%let a=%quote(1=a 2=b 3=C 4=D);
	%let b=%quote(a=x B=y);
	%let e=%quote(1=x 2=y 3= 4=);
	%assignsjoin(a=&a,b=&b,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&d);

	%let d=�������� ���ִ�Сд;
	%let a=%quote(1=a 2=b 3=C 4=D);
	%let b=%quote(a=x B=y);
	%let e=%quote(1=x 2= 3= 4=);
	%assignsjoin(a=&a,b=&b,caseSensitive=1,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&d);

	%let d=�������� ���ƥ��ֵ;
	%let a=%quote(1=a 2=b 3=C 4=D);
	%let b=%quote(a=x B=y B=z);
	%let e=%quote(1=x 2=y 3= 4=);
	%assignsjoin(a=&a,b=&b,caseSensitive=0,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&d);

	%let d=ȱʧ���� aΪ��;
	%let a=;
	%let b=%quote(a=x B=y B=z);
	%let e=;
	%assignsjoin(a=&a,b=&b,caseSensitive=0,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&d);

	%let d=ȱʧ���� bΪ��;
	%let a=%quote(1=a 2=b 3=C 4=D);
	%let b=;
	%let e=%quote(1= 2= 3= 4=);;
	%assignsjoin(a=&a,b=&b,caseSensitive=0,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&d);
%mend;
%macro test_assignsUnique;
	%local tres;%let tres=%createTempVar;%local &tres;

    %let assigns=%quote(a='abc' a='e');
	%let caseSensitive=1;
	%assignsUnique(assigns=&assigns,caseSensitive=&caseSensitive,res=&tres.);
	%let r=&&&tres.;
    %put &r.;

	%let assigns=%quote( ='abc' a='e');
	%let caseSensitive=1;
	%assignsUnique(assigns=&assigns,caseSensitive=&caseSensitive,res=&tres.);
    %let r=&&&tres.;
    %put &r.;

	%let assigns=%quote( a='abc' b='e');
	%let caseSensitive=1;
	%assignsUnique(assigns=&assigns,caseSensitive=&caseSensitive,res=&tres.);
    %let r=&&&tres.;
    %put &r.;

	%let assigns=%quote( a='abc' A='e');
	%let caseSensitive=0;
	%assignsUnique(assigns=&assigns,caseSensitive=&caseSensitive,res=&tres.);
    %let r=&&&tres.;
    %put &r.;

	%let assigns=%quote( a='abc' A='e');
	%let caseSensitive=1;
	%assignsUnique(assigns=&assigns,caseSensitive=&caseSensitive,res=&tres.);
    %let r=&&&tres.;
    %put &r.;

%mend;
%macro test_assignsUpcase;
	%local tres;%let tres=%createTempVar;%local &tres;
	%local prefix suffix cmd a r e;

	%let d=��������;
	%let a=%quote(a='abc' b=123.234 C='ABC����' d=ABCDFGH D=111111);
	%let e=%quote(A='abc' B=123.234 C='ABC����' D=ABCDFGH D=111111);
	%assignsUpcase(assigns=&a,res=&tres);%let r=&&&tres;
	%assertEqual(a=&r,b=&e,msg=&cmd);
	
%mend;
/*%test_assignsUnique;
%test_getAssignVar;
%test_getAssignValue;
%test_assignsFilter;
%test_assignsSuffix;
%test_assignsFind;
%test_assignsSuffix_p1;
%test_assignsVars;
%test_assignsValues;
%test_assignsUpcase;
%test_assignsEqual;
%test_assignsValues;
%test_assignsUpcase;
%test_assignsLeftjoin;
*/
%test_assignsjoin;
