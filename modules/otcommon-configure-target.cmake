# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_configure_target target_name)
  include(otcommon-apply-defines)
  include(otcommon-detect-compiler)
  otcommon_apply_defines(${target_name})

  set_target_properties(${target_name} PROPERTIES POSITION_INDEPENDENT_CODE ON)

  if(MSVC)
    set_target_properties(
      ${target_name} PROPERTIES MSVC_RUNTIME_LIBRARY
                                "${${PROJECT_NAME}_MSVC_RUNTIME_LIBRARY}"
    )
  endif()
endfunction()
