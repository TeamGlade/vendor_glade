# Versioning of the Glade

# Release Versions
GLADE_VERSION_MAJOR = 1
GLADE_VERSION_MINOR = 0

VERSION := $(GLADE_VERSION_MAJOR).$(GLADE_VERSION_MINOR)

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
    GLADE_VERSION := $(VERSION)-$(shell date +%Y%m%d-%H%M%z)-$(TARGET_PRODUCT_SHORT)-$(GLADE_BUILDTYPE)
else
    GLADE_VERSION := $(VERSION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(GLADE_BUILDTYPE)
endif
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=Glade-$(GLADE_VERSION) \
    ro.glade.version=$(GLADE_VERSION)
