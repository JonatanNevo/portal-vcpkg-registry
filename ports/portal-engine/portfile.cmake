vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 542fa33fafb3b902923c79c26be7a16c80822e1f
        SHA512 e41595e0a250d9a87579fc1350170b843d017981384e4333f6240f95940933f3febcc1dccde0f63cc950844fdf9014bd966e1855865ad691640092ff56446895
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