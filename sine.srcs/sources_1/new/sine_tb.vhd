library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity sine_tb is
end sine_tb;

architecture Behavioral of sine_tb is

component sine is
    Port ( clk : in STD_LOGIC;
           sine : out STD_LOGIC_VECTOR (31 downto 0);
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           output_valid : OUT STD_LOGIC;
           input_valid : IN STD_LOGIC);
end component;
           
SIGNAL clk : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL sine_sig : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL data_in : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL output_valid : STD_LOGIC;
SIGNAL input_valid : STD_LOGIC;

begin

sine_function : sine
  PORT MAP (
    clk => clk,
    rst => rst,
    sine => sine_sig,
    data_in => data_in,
    output_valid => output_valid,
    input_valid  => input_valid);
    
process
begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
end process;

process
begin
    rst <= '0';
    wait for 60 ns;
    rst <= '1';
    wait;
end process;

process
begin
    input_valid <= '1';
    wait;
end process;

process
begin
    data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(49,16));
    wait for 200 ns;
    data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(36,16));
    wait for 200 ns;
    data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(225,16));
    wait for 200 ns;
    data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(144,16));
    wait for 200 ns;
    data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(2401,16));
    wait for 200 ns;
end process;
end Behavioral;


