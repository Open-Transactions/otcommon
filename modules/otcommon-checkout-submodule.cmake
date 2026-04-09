# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

macro(otcommon_checkout_submodule submodule_path)
  find_program(
    GIT
    git
    NO_CMAKE_FIND_ROOT_PATH
  )

  if(GIT-NOTFOUND)
    message(FATAL_ERROR "git not found.")
  endif()

  if(NOT
     DEFINED
     ${PROJECT_NAME}_GIT_DIR
  )
    set(${PROJECT_NAME}_GIT_DIR ".git")
  endif()

  execute_process(
    COMMAND ${GIT}
            "--git-dir=${${PROJECT_NAME}_GIT_DIR}"
            "submodule"
            "update"
            "--init"
            "--checkout"
            "--recursive"
            "--"
            "${submodule_path}"
    WORKING_DIRECTORY ${${PROJECT_NAME}_SOURCE_DIR}
    OUTPUT_STRIP_TRAILING_WHITESPACE
    COMMAND_ERROR_IS_FATAL ANY
  )
endmacro()
