library verilog;
use verilog.vl_types.all;
entity ULA1_vlg_check_tst is
    port(
        cout_teste      : in     vl_logic;
        D               : in     vl_logic_vector(0 to 3);
        ov_teste        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ULA1_vlg_check_tst;
