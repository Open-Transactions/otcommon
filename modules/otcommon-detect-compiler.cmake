# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(otcommon_detect_compiler)
  if(${CMAKE_CXX_COMPILER_ID}
     MATCHES
     Clang
  )
    set(COMPILER_IS_CLANG ON)
  else()
    set(COMPILER_IS_CLANG OFF)
  endif()

  if(${CMAKE_CXX_COMPILER_ID}
     MATCHES
     GNU
  )
    set(COMPILER_IS_GCC ON)
  else()
    set(COMPILER_IS_GCC OFF)
  endif()

  if(MSVC)
    if(COMPILER_IS_CLANG)
      message(STATUS "detected compiler as clang-cl")
      set(OTCOMMON_COMPILER_IS_CLANG_CL
          ON
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_MSVC
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_CLANG
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_GCC
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
    else()
      message(STATUS "detected compiler as msvc")
      set(OTCOMMON_COMPILER_IS_CLANG_CL
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_MSVC
          ON
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_CLANG
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
      set(OTCOMMON_COMPILER_IS_GCC
          OFF
          CACHE
            BOOL
            ""
            FORCE
      )
    endif()
  elseif(COMPILER_IS_CLANG)
    message(STATUS "detected compiler as clang")
    set(OTCOMMON_COMPILER_IS_CLANG_CL
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_MSVC
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_CLANG
        ON
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_GCC
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
  elseif(COMPILER_IS_GCC)
    message(STATUS "detected compiler as gcc")
    set(OTCOMMON_COMPILER_IS_CLANG_CL
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_MSVC
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_CLANG
        OFF
        CACHE
          BOOL
          ""
          FORCE
    )
    set(OTCOMMON_COMPILER_IS_GCC
        ON
        CACHE
          BOOL
          ""
          FORCE
    )
  else()
    message(STATUS "could not determine compiler")
  endif()
endfunction()

if(NOT OTCOMMON_COMPILER_DETECTED)
  otcommon_detect_compiler()
  set(OTCOMMON_COMPILER_DETECTED
      ON
      CACHE
        BOOL
        ""
        FORCE
  )
endif()
