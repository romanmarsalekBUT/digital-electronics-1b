----------------------------------------------------------
--
-- Template for traffic lights controller testbench.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_tlc is
  -- Entity of testbench is always empty
end entity tb_tlc;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_tlc is

  -- Local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_CAR_WEST, sig_CAR_SOUTH   : std_logic;
  signal sig_south      : std_logic_vector(2 downto 0);
  signal sig_west       : std_logic_vector(2 downto 0);

begin

  -- Connecting testbench signals with tlc entity
  -- (Unit Under Test)
  uut_tlc : entity work.tlc_speed
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      south => sig_south,
      west  => sig_west,
      CAR_WEST => sig_CAR_WEST,
      CAR_SOUTH => sig_CAR_SOUTH
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 10000 ns loop -- 10 usec of simulation

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;

    wait;

  end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 200 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 500 ns;

    -- Reset deactivated
    sig_rst <= '0';
    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    -- No other input data is needed.
    sig_CAR_WEST <= '1';
    sig_CAR_SOUTH <= '1';
    wait for 1000 ns;
    sig_CAR_WEST <= '0';
    wait for 300 ns;
    sig_CAR_SOUTH <= '0';
    wait for 300 ns;
    sig_CAR_WEST <= '1';
    sig_CAR_SOUTH <= '1';
    
    report "Stimulus process finished";
    wait

  end process p_stimulus;

end architecture testbench;
