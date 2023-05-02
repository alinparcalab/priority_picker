// -----------------------------------------------------------------------------
// Module name: _priority_picker_
// HDL        : System Verilog
// Author     : Alin Parcalab (AP)
// Description: The main task of this module is to pick the first zero from the
//              input vector and output one on the output vector (used in modules like Free Lists)
// Date       : 01 May, 2023
// -----------------------------------------------------------------------------

module _priority_picker_ #
(  // ------------------------------------------
   // ------- Module Parameters  ---------------
   // ------------------------------------------ 
   parameter VEC_W = 16
)( // ------------------------------------------

   // ------------------------------------------
   // ------- I/O Bit Vectors -----------------
   // ------------------------------------------ 
   input  logic [VEC_W-1:0] BitVec_i,
   output logic [VEC_W-1:0] BitVec_o
); // ------------------------------------------

   assign BitVec_o[0] = ~BitVec_i[0]; // Invert the First bit

   for(genvar i=1; i<VEC_W; i++) assign BitVec_o[i] = (& BitVec_i[i-1:0]) & ~BitVec_i[i]; // Optimized on synthesis

endmodule : _priority_picker_
