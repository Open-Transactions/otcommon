# Copyright (c) 2020-2024 The Open-Transactions developers
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

macro(otcommon_find_system_libraries)
  set(THREADS_PREFER_PTHREAD_FLAG ON)
  find_library(LIB_RT rt)
  find_library(LIB_ANDROID_LOG log)
  find_package(Threads REQUIRED)
endmacro()
