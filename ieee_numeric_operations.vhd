----------------------------------------------------------------------------------
-- Engineer: Eren Yıldız
-- 
-- Create Date: 30.10.2026 06:56:38
-- Design Name: ieee_numeric_operations
-- Module Name: ieee_numeric_operations - Behavioral
-- Project Name: IEEE Numeric Standards and Operations
-- Tool Versions: Vivado 202x.x
-- Description: 8-bit vector addition, unsigned type conversion, and conditional threshold comparison using IEEE numeric_std library.
-- 
-- Dependencies: IEEE Std 1076-1993
-- 
-- Additional Comments: Documented with inline notes reflecting my thought process, logic breakdown, and hands-on learning notes during code development.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; --This package lead us to type (un)signed to determine what was the our wires/bits


--What is entity,port,architecture,behavioral etc. I explained it with my own words in another file. You can also find it at my repository


entity ieee_numeric_operations is
    Port ( 

in1 : in STD_LOGIC_vector(7 downto 0); -- Multiple bits (A group/bus of wires) for instance "10101100".
in2 : in STD_LOGIC_VECTOR(7 downto 0);-- instead you can also use (0 to 7) but "downto" form is more common in VHDL. 
out1 : out STD_LOGIC -- Single bit for example it can takes "0" and "1" (but also it can take different types of things like "U", "X" etc.)
 );

end ieee_numeric_operations;

architecture Behavioral of ieee_numeric_operations is

signal s0 : unsigned(7 downto 0) :=x"00" ; --We set a unsigned signal to store the result of the addition of two 8-bit vectors. 
--This unsigned type is neccessary because it is lead us to determine what was the our wires/bits. If we dont use this type then VHDL will not understand if it is number, text, or just random switches.

begin

s0 <= unsigned(in1) + unsigned(in2); 
-- We should type unsigned at this point, if not then there will be occur unmatching because of the fact that VHDL is strong type hardware system. 
--So to VHDL it doesnt determined if it is number, text, or just random switches.
--When we put unsigned we are saying "Hey VHDL, treat these bits as a positive binary number."

process(s0) begin -- We put s0 into "()" (Sensitivity List) because we working on s0 value. If s0 value altered then this block will be executed.
 if (s0 > 20) then
    out1 <= '1' ;
 else
    out1 <= '0' ;
 end if;
end process;

end Behavioral;
