#
# Copyright (C) 2012 Actions-Semi, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This makefile supplies the rules for building a library of JNI code for
# use by our example platform shared library.

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    com_actions_server_DisplayService.cpp \
    DisplayParameters.cpp \
    onload.cpp

LOCAL_SHARED_LIBRARIES := libandroid_runtime libnativehelper libcutils libutils libbinder libhardware

LOCAL_C_INCLUDES += \
    $(JNI_H_INCLUDE) \
    device/ainol/gs702a-common/includes/

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libactions_runtime
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
