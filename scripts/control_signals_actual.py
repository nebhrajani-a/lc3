CONTROL_SIGNALS_ACTUAL = {
    18: {
        "j": 33,
        "cond": 0b101,
        "ld_mar": 1,
        "ld_pc": 1,
        "gate_pc": 1,
        "pcmux": 00,
    },
    33: {
        "j": 33,
        "cond": 0b001,
        "ld_mdr": 1,
        "mio_en": 1,
    },
    35: {
        "j": 32,
        "cond": 0b000,
        "ld_ir": 1,
        "gate_mdr": 1,
    },
    32: {
        "ird": 1,
        "j": 0,
        "cond": 0b000,
        "ld_ben": 1,
    },

    # BR
    0: {
        "j": 18,
        "cond": 0b010,
    },
    22: {
        "j": 18,
        "cond": 0b000,
        "ld_pc": 1,
        "addr2mux": 2,
        "addr1mux": 0,
        "pcmux": 2,
    },

    # JMP
    12: {
        "j": 18,
        "cond": 0b000,
        "sr1mux": 1,
        "addr1mux": 1,
        "addr2mux": 0,
        "pcmux": 2,
        "ld_pc": 1,
    },

    # JSR, JSRR
    4: {
        "j": 20,
        "cond": 0b011,
        "gate_pc": 1,
        "ld_reg": 1,
        "drmux": 1,
    },

    # JSR
    20: {
        "j": 18,
        "cond": 0b000,
        "sr1mux": 1,
        "addr1mux": 1,
        "addr2mux": 0,
        "pcmux": 2,
        "ld_pc": 1,
    },

    # JSRR
    21: {
        "j": 18,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 3,
        "pcmux": 2,
        "ld_pc": 1,
    },

    # ST
    3: {
        "j": 23,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 2,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },
    23: {
        "j": 16,
        "cond": 0b000,
        "sr1mux": 0,
        "aluk": 0b11,
        "gate_alu": 1,
        "mio_en": 0,
        "ld_mdr": 1,
    },
    16: {
        "j": 16,
        "cond": 0b001,
        "r_w": 1,
        "mio_en": 1,
    },

    # STR
    7: {
        "j": 23,
        "cond": 0b000,
        "sr1mux": 1,
        "addr1mux": 1,
        "addr2mux": 1,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },

    # STI
    11: {
        "j": 29,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 2,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },
    29: {
        "j": 29,
        "cond": 0b001,
        "ld_mdr": 1,
        "mio_en": 1,
    },
    31: {
        "j": 23,
        "cond": 0b000,
        "gate_mdr": 1,
        "ld_mar": 1,
    },

    # LDI
    10: {
        "j": 24,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 2,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },
    24: {
        "j": 24,
        "cond": 0b001,
        "ld_mdr": 1,
        "mio_en": 1,
    },
    26: {
        "j": 25,
        "cond": 0b000,
        "gate_mdr": 1,
        "ld_mar": 1,
    },
    25: {
        "j": 25,
        "cond": 0b001,
        "mio_en": 1,
        "ld_mdr": 1,
    },
    27: {
        "j": 18,
        "cond": 0b000,
        "gate_mdr": 1,
        "ld_reg": 1,
        "drmux": 0,
    },

    # LDR
    6: {
        "j": 25,
        "cond": 0b000,
        "sr1mux": 1,
        "addr1mux": 1,
        "addr2mux": 1,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },

    # LD
    2: {
        "j": 25,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 2,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_mar": 1
    },

    # LEA
    14: {
        "j": 18,
        "cond": 0b000,
        "addr1mux": 0,
        "addr2mux": 2,
        "marmux": 1,
        "gate_marmux": 1,
        "ld_reg": 1,
        "drmux": 0,
    },

    # TRAP
    15: {
        "j": 28,
        "cond": 0b000,
        "marmux": 0,
        "gate_marmux": 0,
        "ld_mar": 1
    },
    28: {
        "j": 28,
        "cond": 0b001,
        "mio_en": 1,
        "ld_mdr": 1,
        "gate_pc": 1,
        "ld_reg": 1,
        "drmux": 1
    },
    30: {
        "j": 18,
        "cond": 0b000,
        "gate_mdr": 1,
        "pcmux": 1,
        "ld_pc": 1,
    },

    # NOT
    9: {
        "j": 18,
        "cond": 0b000,
        "sr1mux": 1,
        "aluk": 0b10,
        "gate_alu": 1,
        "drmux": 0,
        "ld_reg": 1,
        "ld_cc": 1,
    },

    # AND
    5: {
        "j": 18,
        "cond": 0b000,
        "sr1mux": 1,
        "aluk": 1,
        "gate_alu": 1,
        "drmux": 0,
        "ld_reg": 1,
        "ld_cc": 1,
    },

    # ADD
    1: {
        "j": 18,
        "cond": 0b000,
        "sr1mux": 1,
        "aluk": 0,
        "gate_alu": 1,
        "drmux": 0,
        "ld_reg": 1,
        "ld_cc": 1,
    },
}
