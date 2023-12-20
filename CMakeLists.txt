# Copyright (c) 2020-2023 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required(VERSION 3.26.0)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/modules")
project(otcommon)
include(otcommon-modules)
include(CMakePackageConfigHelpers)

option(
  OTCOMMON_INSTALL_LICENSE
  "Packing option to control whether or not license file is installed"
  ON
)
option(
  OTCOMMON_INSTALL_FORMAT
  "Packing option to control whether or not formatting files are installed"
  ON
)

otcommon_set_version_from_git()

set(OTCOMMON_MODULES_DIR "cmake")

if(NOT DEFINED OTCOMMON_CMAKE_INSTALL_PATH )
  set(OTCOMMON_CMAKE_INSTALL_PATH "${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME}/${OTCOMMON_MODULES_DIR}")
endif()

if(NOT DEFINED OTCOMMON_LICENSE_FILE_NAME )
  set(OTCOMMON_LICENSE_FILE_NAME "LICENSE")
endif()

if(OTCOMMON_INSTALL_LICENSE)
  install(
    FILES "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE"
    DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME}"
    COMPONENT ${PROJECT_NAME}_documentation
    RENAME "${OTCOMMON_LICENSE_FILE_NAME}"
  )
endif()

set(PACKAGE_INIT_STRING "@PACKAGE_INIT@")
set(MODULES_DIR_STRING "@PACKAGE_MODULES_DIR@")

configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}Config.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake.in"
  @ONLY
)

configure_package_config_file(
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake.in"
  "${CMAKE_BINARY_DIR}/${OTCOMMON_MODULES_DIR}/${PROJECT_NAME}Config.cmake"
  INSTALL_DESTINATION ${OTCOMMON_CMAKE_INSTALL_PATH}
  PATH_VARS OTCOMMON_MODULES_DIR
  NO_SET_AND_CHECK_MACRO NO_CHECK_REQUIRED_COMPONENTS_MACRO
)
write_basic_package_version_file(
  "${CMAKE_BINARY_DIR}/${OTCOMMON_MODULES_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${${PROJECT_NAME}_VERSION_STRING}
  COMPATIBILITY SameMajorVersion
  ARCH_INDEPENDENT
)

install(
  FILES
    "${CMAKE_BINARY_DIR}/${OTCOMMON_MODULES_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_BINARY_DIR}/${OTCOMMON_MODULES_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION ${OTCOMMON_CMAKE_INSTALL_PATH}
  COMPONENT ${PROJECT_NAME}_cmake_modules
)

install(
  FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/find-modules/Findlmdb.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/find-modules/Findunofficial-secp256k1.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/find-modules/Findunofficial-sodium.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/find-modules/Findunofficial-zeromq.cmake"
  DESTINATION "${OTCOMMON_CMAKE_INSTALL_PATH}/find-modules"
  COMPONENT ${PROJECT_NAME}_find_modules
)

install(
  FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-apply-defines.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-configure-target.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-define-job-pools.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-define-signed-overflow.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-detect-msvc-standard-library-from-vcpkg-triplet.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-file-to-hex.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-find-system-libraries.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-generate-cmake-files.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-hide-symbols.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-make-iwyu-target.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-modules.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-pch-pic-workaround.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-print-build-details.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-print-target-compiler-flags.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-require-out-of-source-build.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-set-build-type.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-set-osx-deployment-target.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-set-project-language-standard.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-set-rpath.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-set-version-from-git.cmake"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/otcommon-update-submodules.cmake"
  DESTINATION "${OTCOMMON_CMAKE_INSTALL_PATH}/modules"
  COMPONENT ${PROJECT_NAME}_modules
)

install(
  FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/templates/project.pc.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/templates/uninstall.cmake.in"
  DESTINATION "${OTCOMMON_CMAKE_INSTALL_PATH}/templates"
  COMPONENT ${PROJECT_NAME}_templates
)

if(OTCOMMON_INSTALL_FORMAT)
  install(
    FILES
      "${CMAKE_CURRENT_SOURCE_DIR}/format/clang-format"
      "${CMAKE_CURRENT_SOURCE_DIR}/format/cmake-format.py"
    DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME}/format"
    COMPONENT ${PROJECT_NAME}_format
  )
endif()
