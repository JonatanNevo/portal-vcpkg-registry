vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 6ce6b612f61bfb1aad6e632d12d78a32e53252fb
        SHA512 09027dc6139954be9a700ef333f9d275dc1fd29f0ed37d4da03390cbc6081ad9c62a7a3ae124e1ca6a3a8b1dfd70d03dcecf2027a9dd7c43c1b3d99225df2e63
        HEAD_REF feature/editor-target
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/engine")

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
        PACKAGE_NAME portal-engine
        CONFIG_PATH share/portal-engine
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")