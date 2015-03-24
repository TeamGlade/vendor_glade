#
# This policy configuration will be used by all products that
# inherit from Glade
#

BOARD_SEPOLICY_DIRS += \
    vendor/glade/sepolicy

BOARD_SEPOLICY_UNION += \
service_contexts \
system.te
  

