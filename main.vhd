----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2022 10:16:53 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( clk : in STD_LOGIC;
         clk_div: in std_logic;
         start_stop : in STD_LOGIC;
         semnal_minute : in STD_LOGIC;
         semnal_secunde: in STD_LOGIC;
         detect_alarm : out std_logic;
         anod : out std_logic_vector(3 downto 0);
         catod: out std_logic_vector(6 downto 0)
        );
end main;

architecture Behavioral of main is

    component afisor is
        Port (clk:std_logic;
             clk_div:in std_logic;
             minute_unitati:in std_logic_vector(3 downto 0);
             minute_zeci:in std_logic_vector(3 downto 0);
             secunde_unitati:in std_logic_vector(3 downto 0);
             secunde_zeci:in std_logic_vector(3 downto 0);
             anod:out std_logic_vector(3 downto 0);
             catod: out std_logic_vector(6 downto 0));
    end component afisor;

    type memorie is array (3 downto 0) of std_logic_vector (3 downto 0);
    signal semnale:memorie:=(0=>"0000",1=>"0000",2=>"0000",3=>"0000");


    signal count_down:std_logic:='1';
    signal count_up :std_logic:='1';
    signal s_m:std_logic:='0';
    signal s_s:std_logic:='0';
begin

    e1: afisor port map(clk,clk_div,semnale(2),semnale(3),semnale(0),semnale(1),anod,catod);

    process(clk_div,semnal_minute,semnal_secunde,start_stop,count_down,count_up)
    begin
               if(semnal_minute='1' and semnal_secunde='1')then 
                       semnale(0)<="0000";
                       semnale(1)<="0000";
                       semnale(2)<="0000";
                       semnale(3)<="0000";
                       count_down<='0';
                       count_up<='0';
                       detect_alarm<='0';
               elsif(semnal_secunde='1')then 
                       if(semnale(0)<"1001")then semnale(0)<=semnale(0)+'1';
                       elsif (semnale(1)<"0101")then semnale(1)<=semnale(1)+'1'; semnale(0)<="0000";
                       else semnale(1)<="0000";semnale(0)<="0000";
                       end if;
                       count_down<='0';
                       count_up<='0';
                       detect_alarm<='0';

               elsif(semnal_minute='1')then 
                       if(semnale(2)<"1001")then semnale(2)<=semnale(2)+'1';
                       elsif(semnale(3)<"1001")then semnale(3)<=semnale(3)+'1';semnale(2)<="0000";
                       else semnale(2)<="0000";semnale(3)<="0000";
                       end if;
                       count_down<='0';
                       count_up<='0';
                       detect_alarm<='0';

                
            elsif(start_stop='1' and start_stop'event )then
               if(count_down='0')then count_down<='1';count_up<='0';
               elsif(count_up='1')then count_up<='1';count_down<='0';
               else count_down<='0';count_up<='0';
               end if;
    end if;
	 if(clk_div='1' and clk_div'event) then
        case(count_down) is
		  when '1'=> 
		                  detect_alarm<='0';
                          if(conv_integer(unsigned(semnale(0)))>0) then
                                case (conv_integer(unsigned(semnale(0)))) is
                                when 1 => semnale(0)<="0000";
                                when 2 => semnale(0)<="0001";
                                when 3 => semnale(0)<="0010";
                                when 4 => semnale(0)<="0011";
                                when 5 => semnale(0)<="0100";
                                when 6 => semnale(0)<="0101";
                                when 7 => semnale(0)<="0110";
                                when 8 => semnale(0)<="0111";
                                when others => semnale(0)<="1000";
                                end case;
                            elsif(conv_integer(unsigned(semnale(1)))>0) then semnale(0)<="1001";
                            case (conv_integer(unsigned(semnale(1)))) is
                                when 1 => semnale(1)<="0000";
                                when 2 => semnale(1)<="0001";
                                when 3 => semnale(1)<="0010";
                                when 4 => semnale(1)<="0011";
                                when 5 => semnale(1)<="0100";
                                when 6 => semnale(1)<="0101";
                                when 7 => semnale(1)<="0110";
                                when 8 => semnale(1)<="0111";
                                when others => semnale(1)<="1000";
                                end case;
                                elsif(conv_integer(unsigned(semnale(2)))>0) then semnale(1)<="0101";semnale(0)<="1001";
                                case (conv_integer(unsigned(semnale(2)))) is
                                when 1 => semnale(2)<="0000";
                                when 2 => semnale(2)<="0001";
                                when 3 => semnale(2)<="0010";
                                when 4 => semnale(2)<="0011";
                                when 5 => semnale(2)<="0100";
                                when 6 => semnale(2)<="0101";
                                when 7 => semnale(2)<="0110";
                                when 8 => semnale(2)<="0111";
                                when others => semnale(2)<="1000";
                                end case;
                                elsif(conv_integer(unsigned(semnale(3)))>0) then semnale(2)<="1001";semnale(1)<="1001";semnale(0)<="1001";
                                case (conv_integer(unsigned(semnale(3)))) is
                                when 1 => semnale(3)<="0000";
                                when 2 => semnale(3)<="0001";
                                when 3 => semnale(3)<="0010";
                                when 4 => semnale(3)<="0011";
                                when 5 => semnale(3)<="0100";
                                when 6 => semnale(3)<="0101";
                                when 7 => semnale(3)<="0110";
                                when 8 => semnale(3)<="0111";
                                when others => semnale(3)<="1000";
                                end case;
										  elsif(semnale(0)="0000" and semnale(1)="0000" and semnale(2)="0000" and semnale(3)="0000")then  detect_alarm<='1';
									
                         end if;
        
        when others=> if(count_up='1')then
                detect_alarm<='0';
                if(semnale(0)<"1001")then
                    semnale(0)<=semnale(0)+'1';
                elsif(semnale(1)<"0101")then
                    semnale(1)<=semnale(1)+'1';semnale(0)<="0000";
                elsif(semnale(2)<"1001")then
                    semnale(2)<=semnale(2)+'1';semnale(1)<="0000";semnale(0)<="0000";
                elsif(semnale(3)<"1001")then
                    semnale(3)<=semnale(3)+'1';semnale(2)<="0000";semnale(1)<="0000";semnale(0)<="0000";
                else semnale(3)<="0000";semnale(2)<="0000";semnale(1)<="0000";semnale(0)<="0000";
                end if;
            end if; 
            
        end case;
		end if;

    end process;

end Behavioral;
