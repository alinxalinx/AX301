library verilog;
use verilog.vl_types.all;
entity lpm_add_sub is
    generic(
        lpm_width       : integer := 1;
        lpm_representation: string  := "SIGNED";
        lpm_direction   : string  := "UNUSED";
        lpm_pipeline    : integer := 0;
        lpm_type        : string  := "lpm_add_sub";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        dataa           : in     vl_logic_vector;
        datab           : in     vl_logic_vector;
        cin             : in     vl_logic;
        add_sub         : in     vl_logic;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        clken           : in     vl_logic;
        result          : out    vl_logic_vector;
        cout            : out    vl_logic;
        overflow        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_representation : constant is 1;
    attribute mti_svvh_generic_type of lpm_direction : constant is 1;
    attribute mti_svvh_generic_type of lpm_pipeline : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_add_sub;
