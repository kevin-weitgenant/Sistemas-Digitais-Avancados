library verilog;
use verilog.vl_types.all;
entity mux2pra1_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(0 to 31);
        b               : in     vl_logic_vector(0 to 31);
        sel             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux2pra1_vlg_sample_tst;
