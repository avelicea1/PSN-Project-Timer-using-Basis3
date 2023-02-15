----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2022 09:40:57 PM
-- Design Name: 
-- Module Name: debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
 Port (clk: in std_logic;
  buton: in std_logic;
 butono: out std_logic);
end debouncer;

architecture Behavioral of debouncer is

signal nr: std_logic_vector(5 downto 0):="000000";
signal b:std_logic:='0';

begin

process(clk)
begin
    if(clk='1' and clk'event) then
        if(b=buton)then 
               if(conv_integer(unsigned(nr))= 63)then
                        butono<=buton;
               else
                nr<=nr + '1';
               end if;
         else 
            nr<="000000";
            b<=buton;
         end if; 
    end if;
end process;

end Behavioral;
