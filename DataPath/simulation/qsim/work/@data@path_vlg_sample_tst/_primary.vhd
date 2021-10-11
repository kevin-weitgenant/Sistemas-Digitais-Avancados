library verilog;
use verilog.vl_types.all;
entity DataPath_vlg_sample_tst is
    port(
        c               : in     vl_logic_vector(28 downto 0);
        clock           : in     vl_logic;
        data_in         : in     vl_logic_vector(0 to 31);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DataPath_vlg_sample_tst;
