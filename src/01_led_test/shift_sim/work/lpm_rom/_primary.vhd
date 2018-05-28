library verilog;
use verilog.vl_types.all;
entity lpm_rom is
    generic(
        lpm_width       : integer := 1;
        lpm_widthad     : integer := 1;
        lpm_numwords    : integer := 0;
        lpm_address_control: string  := "REGISTERED";
        lpm_outdata     : string  := "REGISTERED";
        lpm_file        : string  := "";
        intended_device_family: string  := "Stratix";
        lpm_type        : string  := "lpm_rom";
        lpm_hint        : string  := "UNUSED";
        NUM_WORDS       : vl_notype
    );
    port(
        address         : in     vl_logic_vector;
        inclock         : in     vl_logic;
        outclock        : in     vl_logic;
        memenab         : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthad : constant is 1;
    attribute mti_svvh_generic_type of lpm_numwords : constant is 1;
    attribute mti_svvh_generic_type of lpm_address_control : constant is 1;
    attribute mti_svvh_generic_type of lpm_outdata : constant is 1;
    attribute mti_svvh_generic_type of lpm_file : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of NUM_WORDS : constant is 3;
end lpm_rom;
