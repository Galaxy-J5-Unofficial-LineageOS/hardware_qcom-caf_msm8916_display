LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := libqdutils
LOCAL_MODULE_TAGS             := optional
LOCAL_VENDOR_MODULE           := true
LOCAL_SHARED_LIBRARIES        := $(common_libs) libui libbinder libqservice libutils
LOCAL_C_INCLUDES              := $(common_includes) $(kernel_includes)
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdutils\" -Wno-float-conversion
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
LOCAL_EXPORT_C_INCLUDE_DIRS_TO         := $(common_header_export_path)
LOCAL_EXPORT_C_INCLUDE_DIRS            := display_config.h mdp_version.h
LOCAL_SRC_FILES               := profiler.cpp mdp_version.cpp \
                                 idle_invalidator.cpp \
                                 comptype.cpp qd_utils.cpp \
                                 cb_utils.cpp  display_config.cpp \
                                 cb_swap_rect.cpp
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_EXPORT_C_INCLUDE_DIRS_TO           := $(common_header_export_path)
LOCAL_EXPORT_C_INCLUDE_DIRS              := qdMetaData.h qd_utils.h
LOCAL_SHARED_LIBRARIES          := liblog libcutils libhardware libutils
LOCAL_C_INCLUDES                := $(common_includes)
LOCAL_ADDITIONAL_DEPENDENCIES   := $(common_deps)
LOCAL_SRC_FILES                 := qdMetaData.cpp qd_utils.cpp
LOCAL_CFLAGS                    := $(common_flags)
LOCAL_CFLAGS                    += -DLOG_TAG=\"DisplayMetaData\"
LOCAL_MODULE_TAGS               := optional
LOCAL_MODULE                    := libqdMetaData
LOCAL_VENDOR_MODULE             := true
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES          := liblog libcutils libhardware libutils
LOCAL_C_INCLUDES                := $(common_includes)
LOCAL_ADDITIONAL_DEPENDENCIES   := $(common_deps)
LOCAL_SRC_FILES                 := qdMetaData.cpp qd_utils.cpp
LOCAL_CFLAGS                    := $(common_flags) -Wno-sign-conversion
LOCAL_CFLAGS                    += -DLOG_TAG=\"DisplayMetaData\"

LOCAL_MODULE_TAGS               := optional
LOCAL_MODULE                    := libqdMetaData.system

include $(BUILD_SHARED_LIBRARY)
