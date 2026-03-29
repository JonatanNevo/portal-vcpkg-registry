vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 58ba65c62031362d4ef79e2ab280d6c74fffdc57
        SHA512 a9f24a0657d0ca3a87ac34c45c537bfa1acddadb8e8d94b9ad4b34ee20a3bf68da1ca7f274d725b5f8dc4b39b087124570bdaa236cc47f33d1b2fec837b8c477
        HEAD_REF main
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