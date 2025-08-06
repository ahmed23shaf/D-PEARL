#/usr/bin/python3

ports_per_side = 13
start_x = 140
start_y = 44
seperation = 60
pin_list = {
    (0, 0) :  ("gpio_timer", 12),
    (0, 1) :  ("gpio_timer", 13),
    (0, 2) :  ("gpio_timer", 14),
    (0, 3) :  ("vdd", -1),
    (0, 4) :  ("vss", -1),
    (0, 5) :  ("gpio_timer", 15),
    (0, 6) :  ("vss", -1),
    (0, 7) :  ("gpio_timer", 16),
    (0, 8) :  ("vdd", -1),
    (0, 9) :  ("vss", -1),
    (0, 10) : ("gpio_timer", 17),
    (0, 11) : ("gpio_timer", 18),
    (0, 12) : ("gpio_timer", 19),

    (1, 0) :  ("qspi_cs", -1),
    (1, 1) :  ("qspi_io", 1),
    (1, 2) :  ("qspi_io", 2),
    (1, 3) :  ("qspi_io", 0),
    (1, 4) :  ("qspi_ck", -1),
    (1, 5) :  ("qspi_io", 3),
    (1, 6) :  ("vss", -1),
    (1, 7) :  ("qspi_io_t", -1),
    (1, 8) :  ("cpu_boot_mode", -1),
    (1, 9) :  ("top_reset", -1),
    (1, 10) : ("CLK_SEL", -1),
    (1, 11) : ("CLK_IBN", -1),
    (1, 12) : ("CLK_CM", -1),

    (2, 0) :  ("CLK_+", -1),
    (2, 1) :  ("CLK_-", -1),
    (2, 2) :  ("vdd", -1),
    (2, 3) :  ("vdd", -1),
    (2, 4) :  ("vss", -1),
    (2, 5) :  ("vss", -1),
    (2, 6) :  ("vss", -1),
    (2, 7) :  ("shift_io_clk", -1),
    (2, 8) :  ("vdd", -1),
    (2, 9) :  ("vss", -1),
    (2, 10) : ("shift_io_io", -1),
    (2, 11) : ("spi_mosi", -1),
    (2, 12) : ("spi_sck", -1),

    (3, 0) :  ("gpio_timer", 0),
    (3, 1) :  ("gpio_timer", 1),
    (3, 2) :  ("gpio_timer", 2),
    (3, 3) :  ("gpio_timer", 3),
    (3, 4) :  ("gpio_timer", 4),
    (3, 5) :  ("gpio_timer", 5),
    (3, 6) :  ("vss", -1),
    (3, 7) :  ("gpio_timer", 6),
    (3, 8) :  ("gpio_timer", 7),
    (3, 9) :  ("gpio_timer", 8),
    (3, 10) : ("gpio_timer", 9),
    (3, 11) : ("gpio_timer", 10),
    (3, 12) : ("gpio_timer", 11),
}

with open("pins.tcl" , 'w') as f:
    for side_n in range(4):
        for port_n in range(ports_per_side):
            port = pin_list[(side_n, port_n)]
            if (port[0] not in [None, "vss", "vdd"]) and (not port[0].startswith("CLK_")):
                if side_n == 0:
                    x = start_x + port_n * seperation
                    y = 1000 - start_y
                elif side_n == 1:
                    x = 1000 - start_y
                    y = 1000 - (start_x + port_n * seperation)
                elif side_n == 2:
                    x = 1000 - (start_x + port_n * seperation)
                    y = start_y
                elif side_n == 3:
                    x = start_y
                    y = start_x + port_n * seperation
                out_str = "editPin -side INSIDE -layer 7 -assign " + str(x) + " " + str(y) + " -pin " + port[0]
                if (port[1] != -1):
                    out_str += "\[" + str(port[1]) + "\]"
                f.write(out_str + '\n')
            