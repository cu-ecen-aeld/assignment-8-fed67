
##############################################################
#
# LDD
#
##############################################################

define LDD_INSTALL_TARGET_CMDS

 	$(INSTALL) -m 0755 $(LDD_PKGDIR)/*.sh $(TARGET_DIR)/bin
	chmod +x $(TARGET_DIR)/bin/*.sh

    $(INSTALL) -D -m 0755 $(LDD_PKGDIR)/startup_drivers.sh $(TARGET_DIR)/etc/init.d/S98lddmodules
    chmod +x $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(generic-package))
