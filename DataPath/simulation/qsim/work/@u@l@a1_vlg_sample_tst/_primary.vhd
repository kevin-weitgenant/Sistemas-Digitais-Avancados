library verilog;
use verilog.vl_types.all;
entity ULA1_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(0 to 3);
        B               : in     vl_logic_vector(0 to 3);
        controle        : in     vl_logic_vector(0 to 1);
        sampler_tx      : out    vl_logic
    );
end ULA1_vlg_sample_tst;
