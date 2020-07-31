-- MySQL
-- Exercise 2
-- --------
/*1. Select from any table a number and determine whether it is within a given range (for example, between 1 and 10).*/
-- ANS 
		delimiter //
		create procedure checkRange()
        begin
			declare x int(4);
            select sal into x from emp4 where empno = 2;
            if(x between 6000 and 8000) then
				select 'Yes' as result from dual;
			else 
				select 'No' as result from dual;
			end if;
        end//
        delimiter ;
        call checkRange();
select * from emp4;
delete from emp4;
alter table emp4 drop column job;
alter table emp4 add column deptno int(4);
insert into emp4 values('A',5000,1,1),('B',6000,2,1),('C',7000,3,1),('D',9000,4,2),('E',5000,5,2);

/*2. Select from any table three positive integers representing the sides of a triangle, and
determine whether they form a valid triangle. Hint: In a triangle, the sum of any two
sides must always be greater than the third side.*/
-- ANS 
		delimiter //
        create procedure triangle()
        begin
			declare x int(4);
            declare y int(4);
            declare z int(4);
            select a,b,c into x,y,z from tri limit 1;
            if(x+y > z or y+z> x or x+z>y) then 
				select 'Valid' as result from dual;
			else	
				select 'Not Valid' result from dual;
			end if;
        end//
        delimiter ;
        call triangle();
create table tri(a int(4),b int(4),c int(4));
insert into tri values(7,10,5),(1,10,12);
select * from tri;
/*3. Check if a given a year is a leap year. The condition is:- year should be (divisible by 4
and not divisible by 100) or (divisible by 4 and divisible by 400.). The year should be
Selected from some table.*/
-- ANS
		delimiter //
        create procedure leap()
        begin
			declare yr int(4);
            select year(odate) into yr from orders where onum = 3002;
            if ((yr%4 = 0 and yr%100 != 0) or (yr%4 = 0 and yr%400 = 0)) then 
				select 'Leap year' Result from dual;
			else
				select 'Not leap year' Result from dual;
			end if;
        end//
		delimiter ;
        call leap();



/*4. Write a program that Selects from any table two character strings. Your program should
then determine if one character string exists inside another character string.*/
-- ANS 
	delimiter //
    create procedure checkstr()
    begin
		declare a varchar(15);
        declare b varchar(15);
        select substr(cname,2,2) into a from customers where cnum=2004;
        select cname into b from customers where cnum=2007;
        if(locate(a,b)!=0) then
			select 'Yes' as result from dual;
		else 
			select 'No' as result from dual;
		end if;
    end//
    delimiter ;
    drop procedure checkstr;
    call checkstr();

select * from customers;





