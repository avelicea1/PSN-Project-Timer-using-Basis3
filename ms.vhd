----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2022 06:08:26 PM
-- Design Name: 
-- Module Name: ms - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ms is
--  Port ( );
end ms;

architecture Behavioral of ms is
component timer is
    Port ( clk : in STD_LOGIC;
         start_stop : in STD_LOGIC;
         semnal_minute : in STD_LOGIC;
         semnal_secunde : in STD_LOGIC;
         minute : out std_logic_vector(7 downto 0);
         secunde : out std_logic_vector(7 downto 0);
         detect_alarm : out std_logic
        );
end component timer;
signal clk,start_stop, semnal_minute,semnal_secunde,detect_alarm :std_logic :='0';
signal minute,secunde :std_logic_vector (7 downto 0):=(others => '0');
constant clk_period:time :=100 ns;
begin
e1: timer port map (clk, start_stop,semnal_minute,semnal_secunde,minute,secunde,detect_alarm);
clk_process: process
             begin
             clk<='0';
             wait for clk_period/2;
             clk<='1';
             wait for clk_period/2;
             end process;
stimuli: process
         begin
         semnal_minute <='0';
         semnal_secunde <='0';
         start_stop <='0';
         wait for clk_period;
         start_stop<='1';
         wait for clk_period;
         start_stop<='1';
         wait for clk_period;
         semnal_minute<='1';
         start_stop<='0';
         wait for clk_period;
         semnal_minute<='0';
         start_stop<='1';
         wait for clk_period;
         wait;
         end process;

end Behavioral;
