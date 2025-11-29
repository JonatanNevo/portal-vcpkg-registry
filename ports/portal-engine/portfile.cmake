vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 029d54d221b3d185eb1e7f99139bb76013f1a1f4
        SHA512 6ed7291d2e5b0fed71937d561e6e3e0f66e05415af6773efa1874dc217022c61ff795b348d35e72d81784019f0c2b1ba2872238b9343c2edcad08edf18352c76
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/engine")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DPORTAL_FIND_PACKAGE=ON
        -DPORTAL_BUILD_TESTS=OFF
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