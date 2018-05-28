library verilog;
use verilog.vl_types.all;
entity shiftreg is
    port(
        clock           : in     vl_logic;
        shiftin         : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end shiftreg;
