library verilog;
use verilog.vl_types.all;
entity somador_subtrator_nbits is
    port(
        c0              : in     vl_logic;
        a               : in     vl_logic_vector(0 to 3);
        b               : in     vl_logic_vector(0 to 3);
        s               : out    vl_logic_vector(0 to 3);
        cout            : out    vl_logic;
        ov              : out    vl_logic
    );
end somador_subtrator_nbits;
