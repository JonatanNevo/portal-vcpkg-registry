vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF c940d118fd3462231e12c4434487265de1b3dac6
        SHA512 585efb5c15be6b6c9fb8b41e4b281ef0c6940f56396708dd7d667bfcd624639f11cf246cb160f26493fffb6e2cd657ef1f4d9eee46ac23fe8f0dd4799fbdfe27
        HEAD_REF fix/installation
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/serialization")

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
        PACKAGE_NAME portal-serialization
        CONFIG_PATH share/portal-serialization
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")