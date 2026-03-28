vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 28522dd0ce22aa5a5d69b68a870d656c12b8424c
        SHA512 45b13d235039e2f22be4607bade3a39dc3041cfcd87a0dfb860d7a8af06ee537b8edf0d5b348e4f453c1c9d845c048631bd0126a10abdcb1e45675c7d1236d27
        HEAD_REF fix/installer-errors
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/networking")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_BUILD_TESTS=OFF
        -DPORTAL_FIND_PACKAGE=ON

        MAYBE_UNUSED_VARIABLES
            PORTAL_BUILD_TESTS
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