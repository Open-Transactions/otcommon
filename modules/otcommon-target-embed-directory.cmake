# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(
  otcommon_target_embed_directory
  target_name
  path
)
  include(otcommon-detect-compiler)

  if(OTCOMMON_COMPILER_IS_MSVC)
    message(FATAL_ERROR "compiler does not support #embed")
  elseif(OTCOMMON_COMPILER_IS_GCC OR OTCOMMON_COMPILER_IS_CLANG)
    target_compile_options(${target_name} PRIVATE "--embed-dir=${path}")
  endif()
endfunction()
