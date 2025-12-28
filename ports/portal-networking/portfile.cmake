vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF e7a699ebc87284479c61a90a7fc55a67cc173c25
        SHA512 20be146b476867b5628284799929665a2cef66aed559519110522a0d2a2d64a0e1927aacfc117b684c6bea285082625e3b7cf2c2b7456c7a664ff955450c3a2f
        HEAD_REF main
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/networking")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_FIND_PACKAGE=ON
        -DPORTAL_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-networking
        CONFIG_PATH share/portal-networking
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")