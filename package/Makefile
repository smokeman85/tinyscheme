include $(TOPDIR)/rules.mk

PKG_NAME:=tinyscheme
PKG_VERSION:=master
PKG_MD5SUM:=
PKG_LICENSE:=

PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_URL:=https://github.com/smokeman85/tinyscheme.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_PROTO:=git

include $(INCLUDE_DIR)/package.mk

EXTRA_LDFLAGS +=  -ldl

define Package/$(PKG_NAME)
  NAME:=$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Tiny scheme
  URL:=https://github.com/smokeman85/tinyscheme.git
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/scheme $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/libtinyscheme.so $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/scheme-private.h $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/opdefines.h $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/scheme.h $(1)/usr/include
endef

define Package/tinyscheme/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libtinyscheme.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
