library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        data_in         : in     vl_logic_vector(0 to 31);
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        c               : in     vl_logic_vector(28 downto 0);
        data_out        : out    vl_logic_vector(0 to 31);
        r0              : out    vl_logic_vector(0 to 31);
        r1              : out    vl_logic_vector(0 to 31);
        r2              : out    vl_logic_vector(0 to 31);
        ULA1_t          : out    vl_logic_vector(0 to 31);
        ULA2_t          : out    vl_logic_vector(0 to 31);
        Muxes8pra1_UM_t : out    vl_logic_vector(0 to 31);
        Muxes8pra1_DOIS_t: out    vl_logic_vector(0 to 31);
        Muxes8pra1_TRES_t: out    vl_logic_vector(0 to 31);
        cout            : out    vl_logic;
        ov              : out    vl_logic;
        N               : out    vl_logic;
        Z               : out    vl_logic
    );
end DataPath;
