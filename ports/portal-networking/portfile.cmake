vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF 7d61b15bef00a9850884826aa3a1fe0ee182d325
        SHA512 2c5fbfbea5a9b1bc05e220815100dfd4838f87af16fa18740d711b26840ba1e929c41dd1766daec992f66216851b9095a2ab900873747e700a73d762299d30d4
        HEAD_REF main
)

set(SOURCE_PATH "${SOURCE_PATH}/networking")


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DPORTAL_FIND_PACAKGE=ON
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-networking
        CONFIG_PATH share/portal-networking
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()