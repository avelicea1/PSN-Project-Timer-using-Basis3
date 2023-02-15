----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2022 05:47:47 PM
-- Design Name: 
-- Module Name: timer - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Port ( clk : in STD_LOGIC;
         start_stop_in : in STD_LOGIC;
         semnal_minute_in : in STD_LOGIC;
         semnal_secunde_in : in STD_LOGIC;
         detect_alarm : out std_logic;
         anod : out std_logic_vector(3 downto 0);
         catod: out std_logic_vector(6 downto 0)
        );
end timer;

architecture Behavioral of timer is

component main is
Port ( clk : in STD_LOGIC;
       clk_div:in std_logic;
         start_stop : in STD_LOGIC;
         semnal_minute : in STD_LOGIC;
         semnal_secunde: in STD_LOGIC;
         detect_alarm : out std_logic;
         anod : out std_logic_vector(3 downto 0);
         catod: out std_logic_vector(6 downto 0)
        );
end component main;

component debouncer is
 Port (clk: in std_logic;
  buton: in std_logic;
 butono: out std_logic);
end component debouncer;

component divizor_frecventa is
  Port (clk:in std_logic;
        clk_divizat:out std_logic );
end component divizor_frecventa;

    signal clk_div:std_logic;
    signal semnal_minute :std_logic;
    signal semnal_secunde: std_logic;
    signal start_stop:std_logic;
begin

e1: divizor_frecventa port map(clk,clk_div);    
e2: debouncer port map(clk,semnal_minute_in,semnal_minute);
e3: debouncer port map (clk,semnal_secunde_in,semnal_secunde);
e4: debouncer port map(clk,start_stop_in,start_stop);
e5: main port map(clk,clk_div,start_stop,semnal_minute,semnal_secunde,detect_alarm,anod,catod);



end Behavioral;
