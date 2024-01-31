# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_configure_target_external target_name)
  include(otcommon-configure-target)
  otcommon_configure_target(${target_name})
  set_target_properties(
    ${target_name}
    PROPERTIES
      C_INCLUDE_WHAT_YOU_USE ""
      CXX_INCLUDE_WHAT_YOU_USE ""
      C_CLANG_TIDY ""
      CXX_CLANG_TIDY ""
      C_INCLUDE_WHAT_YOU_USE ""
      CXX_INCLUDE_WHAT_YOU_USE ""
      UNITY_BUILD OFF
  )
endfunction()
