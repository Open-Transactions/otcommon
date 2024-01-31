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
        "/W3"
        "/Zc:char8_t-"
        "/bigobj"
        "/utf-8"
        "/wd4068"
        "/wd4250"
    )

    if(${PROJECT_NAME}_PEDANTIC_COMPILER_FLAGS)
      target_compile_options(${target_name} PRIVATE "/WX")
    endif()
  else()
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
  endif()

  if(${CMAKE_CXX_COMPILER_ID}
     MATCHES
     GNU
  )
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
  endif()

  if(${CMAKE_CXX_COMPILER_ID}
     MATCHES
     Clang
  )
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
  endif()
endfunction()
