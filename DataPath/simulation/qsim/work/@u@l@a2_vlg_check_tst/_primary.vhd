library verilog;
use verilog.vl_types.all;
entity ULA2_vlg_check_tst is
    port(
        DATA_OUT        : in     vl_logic_vector(0 to 3);
        N_teste         : in     vl_logic;
        Z_teste         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ULA2_vlg_check_tst;
