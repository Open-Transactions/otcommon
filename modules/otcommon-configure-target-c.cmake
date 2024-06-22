# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_configure_target_c target_name)
  include(otcommon-configure-target)
  otcommon_configure_target(${target_name})

  set_target_properties(
    ${target_name}
    PROPERTIES
      C_STANDARD "${${PROJECT_NAME}_C_STANDARD}"
      CXX_STANDARD "${${PROJECT_NAME}_CXX_STANDARD}"
      CXX_EXTENSIONS OFF
      CXX_STANDARD_REQUIRED ON
  )

  if(MSVC)
    target_compile_options(
      ${target_name}
      PUBLIC "/EHsc"
      PRIVATE
        "/Zc:char8_t-"
        "/bigobj"
        "/utf-8"
    )
  endif()

  if(OTCOMMON_COMPILER_IS_MSVC)
    target_compile_options(
      ${target_name}
      PRIVATE
        "/W3"
        "/wd4068"
        "/wd4250"
    )

    if(${PROJECT_NAME}_PEDANTIC_COMPILER_FLAGS)
      target_compile_options(${target_name} PRIVATE "/WX")
    endif()
  elseif(OTCOMMON_COMPILER_IS_GCC OR OTCOMMON_COMPILER_IS_CLANG)
    target_compile_options(
      ${target_name}
      PRIVATE
        "-W"
        "-Wall"
        "-Wextra"
        "-Wno-pragmas"
        "-Wno-unknown-pragmas"
        "-pedantic"
    )

    if(${PROJECT_NAME}_PEDANTIC_COMPILER_FLAGS)
      target_compile_options(
        ${target_name} PRIVATE "-Werror" "-pedantic-errors"
      )
    endif()
  elseif(OTCOMMON_COMPILER_IS_CLANG_CL)
    target_compile_options(
      ${target_name}
      PRIVATE
        "/clang:-W"
        "/clang:-Wall"
        "/clang:-Wextra"
        "/clang:-Wno-pragmas"
        "/clang:-Wno-unknown-pragmas"
        "/clang:-pedantic"
    )

    if(${PROJECT_NAME}_PEDANTIC_COMPILER_FLAGS)
      target_compile_options(
        ${target_name} PRIVATE "/clang:-Werror" "/clang:-pedantic-errors"
      )
    endif()
  endif()

  if(OTCOMMON_COMPILER_IS_GCC)
    target_compile_options(
      ${target_name}
      PRIVATE
        "-Wcast-align"
        "-Wdouble-promotion"
        "-Wduplicated-branches"
        "-Wduplicated-cond"
        "-Wformat=2"
        "-Winit-self"
        "-Wlogical-op"
        "-Wmissing-declarations"
        "-Wmissing-include-dirs"
        "-Wnull-dereference"
        "-Wrestrict"
        "-Wshadow"
        "-Wswitch-default"
        "-Wswitch-enum"
        "-Wundef"
        "-Wunused-macros"
    )
  elseif(OTCOMMON_COMPILER_IS_CLANG)
    target_compile_options(
      ${target_name}
      PRIVATE
        "-Weverything"
        "-Wno-c++98-compat"
        "-Wno-c++98-compat-pedantic"
        "-Wno-covered-switch-default"
        "-Wno-exit-time-destructors"
        "-Wno-global-constructors"
        "-Wno-inline-namespace-reopened-noninline"
        "-Wno-missing-prototypes"
        "-Wno-missing-variable-declarations"
        "-Wno-padded"
        "-Wno-undefined-func-template"
        "-Wno-unknown-warning-option"
        "-Wno-weak-template-vtables"
        "-Wno-weak-vtables"
    )
  elseif(OTCOMMON_COMPILER_IS_CLANG_CL)
    target_compile_options(
      ${target_name}
      PRIVATE
        "/clang:-Weverything"
        "/clang:-Wno-c++98-compat"
        "/clang:-Wno-c++98-compat-pedantic"
        "/clang:-Wno-covered-switch-default"
        "/clang:-Wno-exit-time-destructors"
        "/clang:-Wno-global-constructors"
        "/clang:-Wno-inline-namespace-reopened-noninline"
        "/clang:-Wno-missing-prototypes"
        "/clang:-Wno-missing-variable-declarations"
        "/clang:-Wno-padded"
        "/clang:-Wno-undefined-func-template"
        "/clang:-Wno-unknown-warning-option"
        "/clang:-Wno-weak-template-vtables"
        "/clang:-Wno-weak-vtables"
    )
  endif()
endfunction()
