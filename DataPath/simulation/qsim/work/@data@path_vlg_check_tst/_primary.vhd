library verilog;
use verilog.vl_types.all;
entity DataPath_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        data_out        : in     vl_logic_vector(0 to 31);
        Muxes8pra1_DOIS_t: in     vl_logic_vector(0 to 31);
        Muxes8pra1_TRES_t: in     vl_logic_vector(0 to 31);
        Muxes8pra1_UM_t : in     vl_logic_vector(0 to 31);
        N               : in     vl_logic;
        ov              : in     vl_logic;
        r0              : in     vl_logic_vector(0 to 31);
        r1              : in     vl_logic_vector(0 to 31);
        r2              : in     vl_logic_vector(0 to 31);
        ULA1_t          : in     vl_logic_vector(0 to 31);
        ULA2_t          : in     vl_logic_vector(0 to 31);
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DataPath_vlg_check_tst;
