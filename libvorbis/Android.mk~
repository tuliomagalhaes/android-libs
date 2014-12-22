LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := vorbis
GLOBAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src


LOCAL_C_INCLUDES := $(GLOBAL_C_INCLUDES)

LOCAL_CFLAGS += -I$(LOCAL_PATH)/include -ffast-math -fsigned-char

ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -march=armv6 -marm -mfloat-abi=softfp -mfpu=vfp
endif

LOCAL_SRC_FILES := \
	src/mdct.c \
	src/smallft.c \
	src/block.c \
	src/envelope.c \
	src/window.c \
	src/lsp.c \
	src/lpc.c \
	src/analysis.c \
	src/synthesis.c \
	src/psy.c \
	src/info.c \
	src/floor1.c \
	src/floor0.c \
	src/res0.c \
	src/mapping0.c \
	src/registry.c \
	src/codebook.c \
	src/sharedbook.c \
	src/lookup.c \
	src/bitrate.c \
	src/vorbisfile.c \
	src/vorbisenc.c

LOCAL_SHARED_LIBRARIES := ogg

include $(BUILD_STATIC_LIBRARY)
