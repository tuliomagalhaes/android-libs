LOCAL_PATH := $(call my-dir)

# boost_date_time
include $(CLEAR_VARS)
LOCAL_MODULE := boost_date_time
LOCAL_SRC_FILES := libboost_date_time-gcc-mt-1_55.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

# boost_filesystem
include $(CLEAR_VARS)
LOCAL_MODULE := boost_filesystem
LOCAL_SRC_FILES := libboost_filesystem-gcc-mt-1_55.a
include $(PREBUILT_STATIC_LIBRARY)

# boost_thread
include $(CLEAR_VARS)
LOCAL_MODULE := boost_thread
LOCAL_SRC_FILES := libboost_thread-gcc-mt-1_55.a
include $(PREBUILT_STATIC_LIBRARY)

# boost_system
include $(CLEAR_VARS)
LOCAL_MODULE := boost_system
LOCAL_SRC_FILES := libboost_system-gcc-mt-1_55.a
include $(PREBUILT_STATIC_LIBRARY)

# boost_program_options
include $(CLEAR_VARS)
LOCAL_MODULE := boost_program_options
LOCAL_SRC_FILES := libboost_program_options-gcc-mt-1_55.a
include $(PREBUILT_STATIC_LIBRARY)

# boost_chrono
include $(CLEAR_VARS)
LOCAL_MODULE := boost_chrono
LOCAL_SRC_FILES := libboost_chrono-gcc-mt-1_55.a
include $(PREBUILT_STATIC_LIBRARY)
