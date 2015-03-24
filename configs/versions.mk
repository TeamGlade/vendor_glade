# Versioning of Glade ROM

# GLADE RELEASE VERSION
GLADE_VERSION_MAJOR = 1
GLADE_VERSION_MINOR = 0
GLADE_VERSION_MAINTENANCE =

VERSION := $(GLADE_VERSION_MAJOR).$(GLADE_VERSION_MINOR)$(GLADE_VERSION_MAINTENANCE)

ifdef BUILDTYPE_NIGHTLY
    GLADE_BUILDTYPE := NIGHTLY
endif
ifdef BUILDTYPE_OFFICIAL
    GLADE_BUILDTYPE := OFFICIAL
endif
ifdef BUILDTYPE_EXPERIMENTAL
    GLADE_BUILDTYPE := EXPERIMENTAL
endif
ifdef BUILDTYPE_RELEASE
    GLADE_BUILDTYPE := RELEASE
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst glade_,,$(TARGET_PRODUCT_SHORT))

# Build the final version string
ifdef BUILDTYPE_RELEASE
    GLADE_VERSION := $(VERSION)-$(TARGET_PRODUCT_SHORT)
else
ifeq ($(GLADE_BUILDTIME_LOCAL),y)
    GLADE_VERSION := Glade-v$(VERSION)-$(shell date +%Y%m%d-%H%M%z)-$(TARGET_PRODUCT_SHORT)-$(GLADE_BUILDTYPE)
else
    GLADE_VERSION := Glade-v$(VERSION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(GLADE_BUILDTYPE)
endif
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(GLADE_VERSION) \
    ro.glade.version=$(VERSION)-$(GLADE_BUILDTYPE)

