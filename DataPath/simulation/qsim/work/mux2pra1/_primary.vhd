library verilog;
use verilog.vl_types.all;
entity mux2pra1 is
    port(
        a               : in     vl_logic_vector(0 to 31);
        b               : in     vl_logic_vector(0 to 31);
        sel             : in     vl_logic;
        saida           : out    vl_logic_vector(0 to 31)
    );
end mux2pra1;
