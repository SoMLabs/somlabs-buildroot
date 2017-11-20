################################################################################
#
# firmware-imx
#
################################################################################

FIRMWARE_IMX_BCMDHD_VERSION = 6bb12724d358092452fc8cc1e358f0710b49cfc5
FIRMWARE_IMX_BCMDHD_SITE = git://git.freescale.com/imx/imx-firmware.git

FIRMWARE_IMX_BCMDHD_LICENSE = NXP Semiconductor Software License Agreement
FIRMWARE_IMX_BCMDHD_LICENSE_FILES = EULA.txt
FIRMWARE_IMX_BCMDHD_REDISTRIBUTE = NO

FIRMWARE_IMX_BCMDHD_BLOBS = 1DX_BCM4343W

# empty build command
define MMC_UTILS_BUILD_CMDS
endef

ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_BCMDHD_1BW),y)
FIRMWARE_IMX_BCMDHD_DIRS += 1BW_BCM43340
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_BCMDHD_1DX),y)
FIRMWARE_IMX_BCMDHD_DIRS += 1DX_BCM4343W
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_BCMDHD_SN8000),y)
FIRMWARE_IMX_BCMDHD_DIRS += SN8000_BCM43362
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_BCMDHD_ZP),y)
FIRMWARE_IMX_BCMDHD_DIRS += ZP_BCM4339
endif


define FIRMWARE_IMX_BCMDHD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/
	for fwdir in $(FIRMWARE_IMX_BCMDHD_DIRS); do \
		cp -r $(@D)/brcm/$${fwdir} $(TARGET_DIR)/lib/firmware; \
	done
endef

$(eval $(generic-package))
