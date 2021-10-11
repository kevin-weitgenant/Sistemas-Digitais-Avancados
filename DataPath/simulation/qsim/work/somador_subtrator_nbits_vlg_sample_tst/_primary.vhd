library verilog;
use verilog.vl_types.all;
entity somador_subtrator_nbits_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(0 to 3);
        b               : in     vl_logic_vector(0 to 3);
        c0              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end somador_subtrator_nbits_vlg_sample_tst;
