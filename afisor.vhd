----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2022 08:58:26 PM
-- Design Name: 
-- Module Name: afisor - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity afisor is
     Port ( clk: in std_logic;
     clk_div:in std_logic;
     minute_unitati:in std_logic_vector(3 downto 0);
     minute_zeci:in std_logic_vector(3 downto 0);
     secunde_unitati:in std_logic_vector(3 downto 0);
     secunde_zeci:in std_logic_vector(3 downto 0); 
     anod:out std_logic_vector(3 downto 0);
     catod: out std_logic_vector(6 downto 0));
end afisor;

architecture Behavioral of afisor is
signal numarator: integer:=0;
signal clock_divizat:std_logic_vector(15 downto 0);
signal s:std_logic_vector(1 downto 0);

begin

s<=clock_divizat(15 downto 14);

process(clk)
begin
if(clk='1' and clk'event) then
clock_divizat<=clock_divizat+'1';
end if;
end process;
process(s)
begin

    anod<="1111";
    case(s) is
    when "00" => anod<="1110";
    case (secunde_unitati) is
        when "0000"=>catod<="1000000";
        when "0001"=>catod<="1111001";
        when "0010"=>catod<="0100100";
        when "0011"=>catod<="0110000";
        when "0100"=>catod<="0011001";
        when "0101"=>catod<="0010010";
        when "0110"=>catod<="0000010";
        when "0111"=>catod<="1111000";
        when "1000"=>catod<="0000000";
        when others=>catod<="0011000";
     end case;
    when "01"=> anod<="1101";
    case secunde_zeci is
        when "0000"=>catod<="1000000";
        when "0001"=>catod<="1111001";
        when "0010"=>catod<="0100100";
        when "0011"=>catod<="0110000";
        when "0100"=>catod<="0011001";
        when "0101"=>catod<="0010010";
        when "0110"=>catod<="0000010";
        when "0111"=>catod<="1111000";
        when "1000"=>catod<="0000000";
        when others=>catod<="0011000";
     end case;
    when "10" => anod<="1011";
    case minute_unitati is
        when "0000"=>catod<="1000000";
        when "0001"=>catod<="1111001";
        when "0010"=>catod<="0100100";
        when "0011"=>catod<="0110000";
        when "0100"=>catod<="0011001";
        when "0101"=>catod<="0010010";
        when "0110"=>catod<="0000010";
        when "0111"=>catod<="1111000";
        when "1000"=>catod<="0000000";
        when others=>catod<="0011000";
     end case;
    when others => anod<="0111";
    case minute_zeci is
        when "0000"=>catod<="1000000";
        when "0001"=>catod<="1111001";
        when "0010"=>catod<="0100100";
        when "0011"=>catod<="0110000";
        when "0100"=>catod<="0011001";
        when "0101"=>catod<="0010010";
        when "0110"=>catod<="0000010";
        when "0111"=>catod<="1111000";
        when "1000"=>catod<="0000000";
        when others=>catod<="0011000";
     end case;
    end case;
    end process;
  
   

end Behavioral;
