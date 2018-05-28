library verilog;
use verilog.vl_types.all;
entity lpm_fifo is
    generic(
        lpm_width       : integer := 1;
        lpm_widthu      : integer := 1;
        lpm_numwords    : integer := 2;
        lpm_showahead   : string  := "OFF";
        lpm_type        : string  := "lpm_fifo";
        lpm_hint        : string  := ""
    );
    port(
        data            : in     vl_logic_vector;
        clock           : in     vl_logic;
        wrreq           : in     vl_logic;
        rdreq           : in     vl_logic;
        aclr            : in     vl_logic;
        sclr            : in     vl_logic;
        q               : out    vl_logic_vector;
        usedw           : out    vl_logic_vector;
        full            : out    vl_logic;
        empty           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthu : constant is 1;
    attribute mti_svvh_generic_type of lpm_numwords : constant is 1;
    attribute mti_svvh_generic_type of lpm_showahead : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_fifo;
