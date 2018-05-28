library verilog;
use verilog.vl_types.all;
entity lpm_ram_dq is
    generic(
        lpm_width       : integer := 1;
        lpm_widthad     : integer := 1;
        lpm_numwords    : vl_notype;
        lpm_indata      : string  := "REGISTERED";
        lpm_address_control: string  := "REGISTERED";
        lpm_outdata     : string  := "REGISTERED";
        lpm_file        : string  := "UNUSED";
        use_eab         : string  := "ON";
        intended_device_family: string  := "Stratix";
        lpm_type        : string  := "lpm_ram_dq";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        data            : in     vl_logic_vector;
        address         : in     vl_logic_vector;
        inclock         : in     vl_logic;
        outclock        : in     vl_logic;
        we              : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthad : constant is 1;
    attribute mti_svvh_generic_type of lpm_numwords : constant is 3;
    attribute mti_svvh_generic_type of lpm_indata : constant is 1;
    attribute mti_svvh_generic_type of lpm_address_control : constant is 1;
    attribute mti_svvh_generic_type of lpm_outdata : constant is 1;
    attribute mti_svvh_generic_type of lpm_file : constant is 1;
    attribute mti_svvh_generic_type of use_eab : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
end lpm_ram_dq;
