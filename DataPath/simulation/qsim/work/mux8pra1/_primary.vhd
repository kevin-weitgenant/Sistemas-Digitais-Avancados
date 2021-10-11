library verilog;
use verilog.vl_types.all;
entity mux8pra1 is
    port(
        sel             : in     vl_logic_vector(0 to 2);
        entrada0        : in     vl_logic_vector(0 to 31);
        entrada1        : in     vl_logic_vector(0 to 31);
        entrada2        : in     vl_logic_vector(0 to 31);
        entrada3        : in     vl_logic_vector(0 to 31);
        entrada4        : in     vl_logic_vector(0 to 31);
        entrada5        : in     vl_logic_vector(0 to 31);
        entrada6        : in     vl_logic_vector(0 to 31);
        entrada7        : in     vl_logic_vector(0 to 31);
        saida           : out    vl_logic_vector(0 to 31)
    );
end mux8pra1;
