vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF e8828a027a5d5888e97d638bdd9852760d96e4c9
        SHA512 03b85b75b658fdc352c64b1cbe70652d3b6ae9347468559e7ab214fd9f7e3c1ff531e51f954578aa5d6d3be13074d1a8a0cae4e29c0a8e01c34146ee12ede0a0
        HEAD_REF main
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/input")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_FIND_PACKAGE=ON
        -DPORTAL_BUILD_TESTS=OFF
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