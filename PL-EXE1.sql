-- PL*SQL
-- Exercise 1
-- -------------------------------
USE DATABASE_FEB20;
SELECT * FROM TEMPP;
-- 1. Write a program that computes the perimeter and the area of a rectangle. Define your own values for the length and width. (Assuming that L and W are the length
-- and width of the rectangle, Perimeter = 2*(L+W) and Area = L*W. Display the output on the screen using dbms_output.put_line.
-- ANS 
		delimiter /
		create procedure rect(len int(4),width int(4))
        begin
            declare per int(10);
            declare area int(10);
            set per = 2*(len + width);
            set area = len* width;
            insert into tempp values(per,'Perimeter');
            insert into tempp values(area,'Area');
		end; /
        delimiter ;
        call rect(5,4);
        select * from tempp;
        
            
            
	

-- 2. Write a program that declares an integer variable called num, assigns a value to it,and computes and inserts into the tempp table the value of the variable itself, its
-- square, and its cube.
-- ANS 
		delimiter / 
        create procedure Calculation()
        begin 
			declare num int(4);
            declare sq int(4);
            declare cu int(4);
            set num = 25;
            set sq = num*num;
            set cu = power(num,3);
            insert into tempp values(sq,'square');
            insert into tempp values(cu,'Cube');
        end /
        delimiter ;
        call Calculation();
        select * from tempp;

-- 3. Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice versa. The required formulae are:- C= (F-32)*5/9 F= 9/5*C + 32 Display the output on the screen using 
-- dbms_output.put_line. Data has to be input by the user.
-- ANS 
		delimiter //
		create procedure temperature(temp float)
        begin
			declare c float;
            declare f float;
            set c = (temp-32) * 5/9 ;
            set f = 9/5 *temp + 32;
			insert into tempp values(f,'Fahrenheit');
            insert into tempp values(c,'Celsius');
        end //
        delimiter ;
        call temperature(32);
		
-- 4. Convert a number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches. Display the output on the screen using dbms_output.put_line. Data has to be input by the user.
-- ANS 
		delimiter //
        create procedure convNum(inch int(4))
        begin
			declare yard float(3,2);
            declare feet float(3,2) ; 
            set feet = inch/12;
            set yard = feet/3;
            set feet = feet mod 3;
            set inch=inch/12;
            select feet,yard from dual;
        end //
        delimiter ;
        call convNum(50);

-- 5. Write a program that enables a user to input an integer. The program should then state whether the integer is evenly divisible by 5. (Use decode instead of IF statement where required). Display the output on the screen using
-- dbms_output.put_line. Data has to be input by the user.
-- ANS 
		delimiter //
        create procedure divBy5(x int)
        begin
			if(x%5 = 0) then 
				select 'Divide by 5' result from dual;
			else
				select 'Not divide by 5' result from dual;            
			end if ;
		end //
        delimiter ;
        call divBy5(20);
drop procedure divBy5;

-- 6. Your block should read in two real numbers and tell whether the product of the two numbers is equal to or greater than 100. Display the output on the screen using dbms_output.put_line. (Use decode instead of IF statement where
-- required). Data has to be input by the user.
-- ANS 
		delimiter //
        create procedure greaterNo(x int,y int)
        begin
			if(x*y = 100) then 
				select 'Equal to 100 'as result from dual;
			elseif(x*y > 100) then
				select 'Greater than 100' as result from dual;
			else
				select 'Less than 100' as result from dual;
			end if;
        end //
        delimiter //
        call greaterNo(10,2);

