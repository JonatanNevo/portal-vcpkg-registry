vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 335fe8807dc111814b23e5598f0b786b247e2455
        SHA512 c53c981639d8f642b882ce183b1c84cabbfb2a0bebd50de50caafe23e2fe10eaea4464934ec5c8168ac834893a2320d7b29d99eb05c4adff4d61cde7f73e7e37
        HEAD_REF feature/editor-target
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