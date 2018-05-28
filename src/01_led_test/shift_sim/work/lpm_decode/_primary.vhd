library verilog;
use verilog.vl_types.all;
entity lpm_decode is
    generic(
        lpm_width       : integer := 1;
        lpm_decodes     : vl_notype;
        lpm_pipeline    : integer := 0;
        lpm_type        : string  := "lpm_decode";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        data            : in     vl_logic_vector;
        enable          : in     vl_logic;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        clken           : in     vl_logic;
        eq              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_decodes : constant is 3;
    attribute mti_svvh_generic_type of lpm_pipeline : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_decode;
