library verilog;
use verilog.vl_types.all;
entity lpm_shiftreg is
    generic(
        lpm_width       : integer := 1;
        lpm_direction   : string  := "LEFT";
        lpm_avalue      : string  := "UNUSED";
        lpm_svalue      : string  := "UNUSED";
        lpm_pvalue      : string  := "UNUSED";
        lpm_type        : string  := "lpm_shiftreg";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        data            : in     vl_logic_vector;
        clock           : in     vl_logic;
        enable          : in     vl_logic;
        shiftin         : in     vl_logic;
        load            : in     vl_logic;
        aclr            : in     vl_logic;
        aset            : in     vl_logic;
        sclr            : in     vl_logic;
        sset            : in     vl_logic;
        q               : out    vl_logic_vector;
        shiftout        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_direction : constant is 1;
    attribute mti_svvh_generic_type of lpm_avalue : constant is 1;
    attribute mti_svvh_generic_type of lpm_svalue : constant is 1;
    attribute mti_svvh_generic_type of lpm_pvalue : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_shiftreg;
