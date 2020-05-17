module DP(input[2:0] AluOperation,input[1:0] PCSrc,input[1:0] AluSrcB,input rst,clk,PcSrc,link,RegDst,RegWrite,AluSrcA,
	IRWrite,IorD,MemWrite,MemRead,MemToReg,PCWrite,PCWriteCond,branch,output[5:0] func,output[5:0] opcode);

module centeralCU(AluOp, PCSrc, AluSrcB, clk, link, RegDst, RegWrite, AluSrcA, 
	IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch, opcode);
	
	output[1:0] AluOp;
	output[1:0] PCSrc;
	output[1:0] AluSrcB;
	output clk, PcSrc, link, RegDst, RegWrite, AluSrcA, IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch;
	input[5:0] opcode;
	
	parameter [3:0] IF=0, ID=1, RT0=2, RT1=3, Jump=4, Beq=5, Bne=6, Jr=7, Jal=8, Memref=9, SW=10, Lw0=11, LW1=12;
	reg [3:0] ps, ns;
	
	always@(ps, opcode)begin
	  
	end
	//sequensil
  always@(posedge clk, posedge rst) begin
    if(rst) ps <= Idle;
    else  ps <= ns;
  end
endmodule
  
  
module ALUcontroller(AluOp, func, AluOperation);
  input [1:0] AluOp;
  input [5:0] func;
  output reg [2:0] AluOperation;
  
  always@(AluOp, func) begin
    AluOperation <= 3'b000;
    case(AluOp)
      2'b00: AluOperation <= 3'b010;
      2'b01: AluOperation <= 3'b110;
      2'b10: begin
              if( func == 6'b100000) AluOperation <= 3'b010;
              if( func == 6'b100010) AluOperation <= 3'b110;
              if( func == 6'b100100) AluOperation <= 3'b000;
              if( func == 6'b100101) AluOperation <= 3'b001;
              if( func == 6'b101010) AluOperation <= 3'b111;
             end
      2'b11: AluOperation <= 3'b000;
    endcase
  end
endmodule