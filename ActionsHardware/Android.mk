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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    $(call all-java-files-under, core) \
    $(call all-java-files-under, services)
    
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := actions

LOCAL_MODULE_CLASS := JAVA_LIBRARIES

# AIDL
LOCAL_AIDL_INCLUDES += $(LOCAL_PATH)/core/java

LOCAL_SRC_FILES += \
    core/java/com/actions/hardware/ICableStatusListener.aidl \
    core/java/com/actions/hardware/IDisplayService.aidl

framework_built := $(call java-lib-deps, framework)

LOCAL_PRELINK_MODULE := false

include $(BUILD_JAVA_LIBRARY)

# The JNI component
include $(CLEAR_VARS)
include $(call all-makefiles-under, $(LOCAL_PATH))