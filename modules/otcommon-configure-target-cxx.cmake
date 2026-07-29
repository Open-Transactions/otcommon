# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_configure_target_cxx target_name)
  include(otcommon-configure-target-c)
  otcommon_configure_target_c(${target_name})

  if(OTCOMMON_COMPILER_IS_GCC OR OTCOMMON_COMPILER_IS_CLANG)
    target_compile_options(${target_name} PRIVATE "-fno-char8_t")
  elseif(OTCOMMON_COMPILER_IS_CLANG_CL)
    target_compile_options(${target_name} PRIVATE "/clang:-fno-char8_t")
  endif()

  if(OTCOMMON_COMPILER_IS_GCC)
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
        "-Wno-non-virtual-dtor"
    )
    # ~~~
    # NOTE -Wnon-virtual-dtor is superseded by -Wdelete-non-virtual-dtor (included in -Wall)
    # https://patchwork.sourceware.org/project/gcc/patch/20221123101038.2192550-1-jwakely@redhat.com/
    # ~~~
  endif()
endfunction()
