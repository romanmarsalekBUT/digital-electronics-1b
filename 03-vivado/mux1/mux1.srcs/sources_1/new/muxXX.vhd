----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 04:32:07 PM
-- Design Name: 
-- Module Name: muxXX - Behavioral
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

entity muxXX is
    Port ( a_i : in STD_LOGIC_VECTOR (2 downto 0);
           b_i : in STD_LOGIC_VECTOR (2 downto 0);
           c_i : in STD_LOGIC_VECTOR (2 downto 0);
           d_i : in STD_LOGIC_VECTOR (2 downto 0);
           sel_i : in STD_LOGIC_VECTOR (2 downto 0);
           f_o : out STD_LOGIC_VECTOR (2 downto 0));
end muxXX;

architecture Behavioral of muxXX is

begin


end Behavioral;
