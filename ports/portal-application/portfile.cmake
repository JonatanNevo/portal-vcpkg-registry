vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 35e2f0fd6072ec1267c488af21b7724e65259249
        SHA512 854ed2e4e5c44df9750580190722c341faafd0dee3fa7ddc310ada9b304bbe984f5f64b7becb76515956402365ed3de60fa7123bc5b4e3660bebe5d398edc420
        HEAD_REF fix/installation
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/application")

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
        PACKAGE_NAME portal-application
        CONFIG_PATH share/portal-application
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")