library verilog;
use verilog.vl_types.all;
entity ULA2_vlg_sample_tst is
    port(
        C               : in     vl_logic_vector(0 to 3);
        controle        : in     vl_logic_vector(0 to 1);
        D               : in     vl_logic_vector(0 to 3);
        sampler_tx      : out    vl_logic
    );
end ULA2_vlg_sample_tst;
