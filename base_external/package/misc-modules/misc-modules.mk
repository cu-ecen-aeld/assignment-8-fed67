
##############################################################
#
# MISC_MODULES
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
MISC_MODULES_VERSION = bc1f0e29a90b1211acbcbbf060c6bf2d9ff07078
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
# MISC_MODULES_SITE = git@github.com:cu-ecen-aeld/assignment-7-fed67.git
MISC_MODULES_SITE = https://github.com/cu-ecen-aeld/assignment-7-fed67.git
MISC_MODULES_SITE_METHOD = git
MISC_MODULES_GIT_SUBMODULES = YES

MISC_MODULES_MODULE_SUBDIRS = misc-modules/ 

$(eval $(kernel-module))
$(eval $(generic-package))