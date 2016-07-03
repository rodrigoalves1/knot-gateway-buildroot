################################################################################
#
# libgpg-error
#
################################################################################

LIBGPG_ERROR_VERSION = 1.23
LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
LIBGPG_ERROR_INSTALL_STAGING = YES
LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config

define LIBGPG_ERROR_FIX_CROSS_COMPILATION
	cd $(@D)/src/syscfg && \
	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
		lock-obj-pub.$(GNU_TARGET_NAME).h
endef
LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION

$(eval $(autotools-package))
