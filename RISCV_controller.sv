module RISCV_controller (
    input  logic       clk, reset,
    input  logic [6:0] op,
    input  logic [2:0] funct3,
    input  logic       funct7b5,
    input  logic       zero,
    output logic [1:0] immsrc,
    output logic [1:0] alusrca, alusrcb,
    output logic [1:0] resultsrc,
    output logic       adrsrc,
    output logic [2:0] alucontrol,
    output logic       irwrite, pcwrite, regwrite, memwrite
);
    logic [1:0] aluop;
    logic       branch, pcupdate;

    // Logic gate for PCWrite as per Figure 1 
    assign pcwrite = (branch & zero) | pcupdate;

    mainfsm fsm(clk, reset, op, resultsrc, alusrca, alusrcb, aluop, adrsrc, irwrite, pcupdate, regwrite, memwrite, branch);
    aludec  ad(op[5], funct3, funct7b5, aluop, alucontrol);
    instrdec id(op, immsrc);
endmodule