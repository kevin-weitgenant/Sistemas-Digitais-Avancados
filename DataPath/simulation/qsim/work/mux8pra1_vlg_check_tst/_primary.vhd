library verilog;
use verilog.vl_types.all;
entity mux8pra1_vlg_check_tst is
    port(
        saida           : in     vl_logic_vector(0 to 31);
        sampler_rx      : in     vl_logic
    );
end mux8pra1_vlg_check_tst;
