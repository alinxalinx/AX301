library verilog;
use verilog.vl_types.all;
entity lpm_mult is
    generic(
        lpm_widtha      : integer := 1;
        lpm_widthb      : integer := 1;
        lpm_widthp      : integer := 1;
        lpm_widths      : integer := 1;
        lpm_representation: string  := "UNSIGNED";
        lpm_pipeline    : integer := 0;
        lpm_type        : string  := "lpm_mult";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        dataa           : in     vl_logic_vector;
        datab           : in     vl_logic_vector;
        sum             : in     vl_logic_vector;
        aclr            : in     vl_logic;
        sclr            : in     vl_logic;
        clock           : in     vl_logic;
        clken           : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_widtha : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthb : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthp : constant is 1;
    attribute mti_svvh_generic_type of lpm_widths : constant is 1;
    attribute mti_svvh_generic_type of lpm_representation : constant is 1;
    attribute mti_svvh_generic_type of lpm_pipeline : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_mult;
