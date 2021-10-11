library verilog;
use verilog.vl_types.all;
entity somador_subtrator_nbits_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        ov              : in     vl_logic;
        s               : in     vl_logic_vector(0 to 3);
        sampler_rx      : in     vl_logic
    );
end somador_subtrator_nbits_vlg_check_tst;
