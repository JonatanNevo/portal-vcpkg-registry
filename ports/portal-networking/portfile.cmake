vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF 1f6956c3a79963528bc8e0bb92d4a4614904ed6b
        SHA512 691a233c856f5c87e20f3f1f380a0a7bc13e1c9c1f996fad9001513185261a3eb4ff29f8571951c3806526e233baad48320962d2f9fc7d98da1680bd4b48c32e
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