----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2022 10:32:39 PM
-- Design Name: 
-- Module Name: divizor_frecventa - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divizor_frecventa is
  Port (clk:in std_logic;
        clk_divizat:out std_logic );
end divizor_frecventa;

architecture Behavioral of divizor_frecventa is
signal div: std_logic_vector(25 downto 0);
begin

clk_divizat<=div(25);

process(clk)
begin
    if(clk='1' and clk'event) then
            div<=div+1;
    end if;
end process;
end Behavioral;
