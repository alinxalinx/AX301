library verilog;
use verilog.vl_types.all;
entity lpm_clshift is
    generic(
        lpm_width       : integer := 1;
        lpm_widthdist   : integer := 1;
        lpm_shifttype   : string  := "LOGICAL";
        lpm_pipeline    : integer := 0;
        lpm_type        : string  := "lpm_clshift";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        data            : in     vl_logic_vector;
        distance        : in     vl_logic_vector;
        direction       : in     vl_logic;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        clken           : in     vl_logic;
        result          : out    vl_logic_vector;
        underflow       : out    vl_logic;
        overflow        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthdist : constant is 1;
    attribute mti_svvh_generic_type of lpm_shifttype : constant is 1;
    attribute mti_svvh_generic_type of lpm_pipeline : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_clshift;
