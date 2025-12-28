vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF bbd0a11553f5ca99b16bd690259ae90c02c17923
        SHA512 e5fbef205b42c6462288dea94b9e0c145589bedda7d4dcb9a125ebe1a7e4888fe859c0326dee945ce98855f73cba8416787756247dbdca7c40348dac8659d2d8
        HEAD_REF main
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/serialization")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_FIND_PACKAGE=ON
        -DPORTAL_BUILD_TESTS=OFF
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