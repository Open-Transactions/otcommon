# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_configure_target_cxx target_name)
  include(otcommon-configure-target-c)
  otcommon_configure_target_c(${target_name})

  if(NOT MSVC)
    target_compile_options(${target_name} PRIVATE "-fno-char8_t")
  endif()

  if(${CMAKE_CXX_COMPILER_ID}
     MATCHES
     GNU
  )
    target_compile_options(
      ${target_name}
      PRIVATE
        "-Wctor-dtor-privacy"
        "-Weffc++"
        "-Wnoexcept"
        "-Wold-style-cast"
        "-Woverloaded-virtual"
        "-Wstrict-null-sentinel"
        "-Wsuggest-override"
    )
  endif()
endfunction()
