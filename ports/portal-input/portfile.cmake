vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 0b6d71e2e566adb5b240844fede53830684e9fb2
        SHA512 8dc6a97d46ef32ed2803f1b37a2ce7f47e4b92596d9c8491b39549d74f7da515c3b7e6f65a564354a35faa10b17004d9dcf5ac8e32816a4b54f141185fa46e36
        HEAD_REF fix/packaged-errors
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/input")

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
        PACKAGE_NAME portal-input
        CONFIG_PATH share/portal-input
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")