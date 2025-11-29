vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF c0ee89e03b6e6d5faa4c3993641930463a773fd2
        SHA512 988a3bec54b8cfa52af1929168aeb84bb77e88c3ed339b7ecf338d069d753c31b1c48ff9908021d4adad80be8285162ebc1b31007b1986c70fb6310942c3f6e4
        HEAD_REF fix/vcpkg-packaging
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