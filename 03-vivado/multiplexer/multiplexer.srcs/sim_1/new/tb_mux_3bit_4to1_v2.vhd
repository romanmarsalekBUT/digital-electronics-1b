----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 09:51:04 AM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1_v2 - Behavioral
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


library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1_v2 is
  -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1_v2;


architecture testbench of tb_mux_3bit_4to1_v2 is

  -- Testbench local signals
  signal a_i           : std_logic_vector(2 downto 0);
  signal b_i           : std_logic_vector(2 downto 0);
  signal c_i           : std_logic_vector(2 downto 0);
  signal d_i           : std_logic_vector(2 downto 0);
  signal f_o           : std_logic_vector(2 downto 0);
  signal sel_i         : std_logic_vector(1 downto 0);

begin

  -- Connecting testbench signals with comparator_4bit
  -- entity (Unit Under Test)
  uut_tb_mux_3bit_4to1_v2: entity work.mux_3bit_4to1
    port map (
      a_i           => a_i,
      b_i           => b_i,
      c_i           => c_i,
      d_i           => d_i,
      f_o           => f_o,
      sel_i => sel_i
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    
-- First test case ...
    a_i <= "000";
    b_i <= "001";
    c_i <= "010";
    d_i <= "100";
    sel_i <= "01";
        
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            (f_o = "001") 
             )
      -- If false, then report an error
      -- If true, then do not report anything
      report "sel_i = 01 FAILED"
      severity error;


-- Second test case ...
    a_i <= "000";
    b_i <= "001";
    c_i <= "010";
    d_i <= "100";
    sel_i <= "11";
        
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            (f_o = "100") 
             )
      -- If false, then report an error
      -- If true, then do not report anything
      report "sel_i = 11 FAILED"
      severity error;


  end process p_stimulus;

end architecture testbench;
