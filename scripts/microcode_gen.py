from control_signals_actual import CONTROL_SIGNALS_ACTUAL


class Microcode:
    def __init__(self, sig_in):
        self.signal_list = [
            "j", "cond", "ird", "ld_ben", "ld_mar", "ld_mdr", "ld_ir", "ld_pc",
            "ld_reg", "ld_cc", "gate_marmux", "gate_mdr", "gate_alu",
            "gate_pc", "marmux", "pcmux", "addr1mux", "addr2mux", "drmux",
            "sr1mux", "aluk", "mio_en", "r_w"
        ]
        self.signals = dict.fromkeys(self.signal_list, 0)
        self.widths = dict.fromkeys(self.signal_list, 1)
        for signal in ("pcmux", "addr2mux", "drmux", "sr1mux", "aluk"):
            self.widths[signal] = 2
        self.widths["j"] = 6
        self.widths["cond"] = 3

        self.data = {n: self.signals.copy() for n in range(2**6)}
        for state in sig_in:
            self.data[state] |= sig_in[state]

    def write_readmemb_file(self, filename):
        with open(filename, "w") as micro_f:
            for state in self.data.values():
                for signal in state.items():
                    micro_f.write(
                        bin(signal[1])[2:].zfill(self.widths[signal[0]]))
                micro_f.write("\n")


a = Microcode(CONTROL_SIGNALS_ACTUAL)
a.write_readmemb_file("microcode.bin")
