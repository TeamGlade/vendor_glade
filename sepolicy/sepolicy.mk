#
# This policy configuration will be used by all products that
# inherit from Glade
#

BOARD_SEPOLICY_DIRS += \
    vendor/glade/sepolicy

BOARD_SEPOLICY_UNION += \
    service_contexts \
    system.te \
    file.te \
    file_contexts \
    genfs_contexts \
    seapp_contexts \
    service_contexts \
    auditd.te \
    healthd.te \
    installd.te \
    netd.te \
    sysinit.te \
    system.te \
    ueventd.te \
    vold.te \
    mac_permissions.xml
