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
    property_contexts \
    seapp_contexts \
    service_contexts \
    auditd.te \
    healthd.te \
    hostapd.te \
    installd.te \
    netd.te \
    property.te \
    shell.te \
    sysinit.te \
    system.te \
    system_app.te \
    ueventd.te \
    uncrypt.te \
    userinit.te \
    vold.te \
    mac_permissions.xml
