library verilog;
use verilog.vl_types.all;
entity mux8pra1_vlg_sample_tst is
    port(
        entrada0        : in     vl_logic_vector(0 to 31);
        entrada1        : in     vl_logic_vector(0 to 31);
        entrada2        : in     vl_logic_vector(0 to 31);
        entrada3        : in     vl_logic_vector(0 to 31);
        entrada4        : in     vl_logic_vector(0 to 31);
        entrada5        : in     vl_logic_vector(0 to 31);
        entrada6        : in     vl_logic_vector(0 to 31);
        entrada7        : in     vl_logic_vector(0 to 31);
        sel             : in     vl_logic_vector(0 to 2);
        sampler_tx      : out    vl_logic
    );
end mux8pra1_vlg_sample_tst;
