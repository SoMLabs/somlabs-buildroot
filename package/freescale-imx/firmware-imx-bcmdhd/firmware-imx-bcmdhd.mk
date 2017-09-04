################################################################################
#
# firmware-imx
#
################################################################################

FIRMWARE_IMX_BCMDHD_VERSION = 4.1.15-1.2.0
FIRMWARE_IMX_BCMDHD_SITE = 
FIRMWARE_IMX_BCMDHD_SOURCE = 
FIRMWARE_IMX_BCMDHD_ARCHIVE = bcmdhd-$(FIRMWARE_IMX_BCMDHD_VERSION).tar.gz

FIRMWARE_IMX_BCMDHD_LICENSE = NXP Semiconductor Software License Agreement
FIRMWARE_IMX_BCMDHD_LICENSE_FILES = EULA COPYING
FIRMWARE_IMX_BCMDHD_REDISTRIBUTE = NO

FIRMWARE_IMX_BCMDHD_BLOBS = 1DX_BCM4343W

define FIRMWARE_IMX_BCMDHD_EXTRACT_CMDS
	$(call suitable-extractor,$(FIRMWARE_IMX_BCMDHD_ARCHIVE)) $(DL_DIR)/$(FIRMWARE_IMX_BCMDHD_ARCHIVE) | \
        $(TAR) -C $(FIRMWARE_IMX_BCMDHD_DIR) $(TAR_OPTIONS) -
endef

define BCMDHD_EXTRACT_FW
	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_BCMDHD_DIR)/packages/firmware-bcmdhd-1.0.3.bin)
endef

define BCMDHD_EXTRACT_UTILS
	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_BCMDHD_DIR)/packages/BSA-ServerAndClientApps-0107.00.16.00.bin)
endef

FIRMWARE_IMX_BCMDHD_POST_EXTRACT_HOOKS += BCMDHD_EXTRACT_FW
#FIRMWARE_IMX_BCMDHD_POST_EXTRACT_HOOKS += BCMDHD_EXTRACT_UTILS

define FIRMWARE_IMX_BCMDHD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/
	for blobdir in $(FIRMWARE_IMX_BCMDHD_BLOBS); do \
		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
	done
endef

$(eval $(generic-package))
