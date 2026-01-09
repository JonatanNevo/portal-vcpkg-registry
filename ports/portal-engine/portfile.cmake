vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 3bb8fc450b5e178e8923817339bda69c32a48d62
        SHA512 0c8e2491c257f9ab8dc92439a973d95fc5a367ecce3a48ff7389215ed41e7fa05b2fe5c532e10d0792ee541aa6d5da085d48aaa7388d76a61514cc7a1a38dfc0
        HEAD_REF main
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/engine")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_BUILD_TESTS=OFF
        -DPORTAL_FIND_PACKAGE=ON
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