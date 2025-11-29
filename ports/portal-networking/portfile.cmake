vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF bf1acd784925061a72137745b201c2008a6b71d3
        SHA512 e5f12fd953ac2f06cb4f2ace043bd66a00695268610082e2be3a57b9accb1c2fa479b5ee8b4a813e6f9542ef3026840fed4414609d9e9ed3d7406f9c58ba2fec
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${SOURCE_PATH}/networking")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-networking
        CONFIG_PATH share/portal-networking
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()