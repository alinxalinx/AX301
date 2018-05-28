library verilog;
use verilog.vl_types.all;
entity lpm_constant is
    generic(
        lpm_width       : integer := 1;
        lpm_cvalue      : integer := 0;
        lpm_strength    : string  := "UNUSED";
        lpm_type        : string  := "lpm_constant";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_cvalue : constant is 1;
    attribute mti_svvh_generic_type of lpm_strength : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_constant;
