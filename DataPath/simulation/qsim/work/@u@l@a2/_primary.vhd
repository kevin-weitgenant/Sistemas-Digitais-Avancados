library verilog;
use verilog.vl_types.all;
entity ULA2 is
    port(
        controle        : in     vl_logic_vector(0 to 1);
        C               : in     vl_logic_vector(0 to 3);
        D               : in     vl_logic_vector(0 to 3);
        Z_teste         : out    vl_logic;
        N_teste         : out    vl_logic;
        DATA_OUT        : out    vl_logic_vector(0 to 3)
    );
end ULA2;
