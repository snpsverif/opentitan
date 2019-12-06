// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Assertions for ${dut.name}.
// Intended to be used with a formal tool.

% if len(dut.pkgs) > 0:
module ${dut.name}_assert_fpv
% for pkg in dut.pkgs:
  import ${pkg};
% endfor
% if dut.params:
#(
% else:
(
% endif
% else:
% if dut.params:
module ${dut.name}_assert_fpv #(
% else:
module ${dut.name}_assert_fpv (
% endif
% endif
% if dut.params:
% for k, param in enumerate(dut.params):
<% comma = "" if (k == len(dut.params)-1) else "," %>  ${param.style} ${param.datatype} ${param.name} =${param.value}${comma}
% endfor
) (
% endif
% for k, port in enumerate(dut.ports):
<% comma = "" if (k == len(dut.ports)-1) else "," %>  input ${port.datatype} ${port.name}${comma}
% endfor
);

  ///////////////////////////////
  // Declarations & Parameters //
  ///////////////////////////////

  /////////////////////////
  // Forward Assumptions //
  /////////////////////////

  // `ASSUME(MyAssumption_M, ..., clk_i, !rst_ni)

  /////////////////////////
  // Backward Assertions //
  /////////////////////////

  // `ASSUME(MyAssertions_A, ..., clk_i, !rst_ni)

endmodule : ${dut.name}_assert_fpv