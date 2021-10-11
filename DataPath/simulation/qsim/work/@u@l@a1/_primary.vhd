library verilog;
use verilog.vl_types.all;
entity ULA1 is
    port(
        controle        : in     vl_logic_vector(0 to 1);
        A               : in     vl_logic_vector(0 to 3);
        B               : in     vl_logic_vector(0 to 3);
        cout_teste      : out    vl_logic;
        ov_teste        : out    vl_logic;
        D               : out    vl_logic_vector(0 to 3)
    );
end ULA1;
