# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

include(otcommon-checkout-submodule)

function(otcommon_bootstrap_vcpkg submodule_path)
  otcommon_checkout_submodule("${submodule_path}")

  if(NOT
     DEFINED
     OTCOMMON_VCPKG_BOOTSTRAP
  )
    if(WIN32)
      set(OTCOMMON_VCPKG_BOOTSTRAP "bootstrap-vcpkg.bat")
    else()
      set(OTCOMMON_VCPKG_BOOTSTRAP "bootstrap-vcpkg.sh")
    endif()
  endif()

  execute_process(
    COMMAND ${OTCOMMON_VCPKG_BOOTSTRAP}
    WORKING_DIRECTORY
      ${submodule_path}
      COMMAND_ERROR_IS_FATAL
      ANY
  )
endfunction()
