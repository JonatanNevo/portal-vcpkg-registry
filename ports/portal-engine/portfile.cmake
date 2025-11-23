vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF 81c330a0d6e38cffe970beaad9fd9db099b3c847
        SHA512 3521f52d0c02df07c64a73d872cbd61abab1516bfc77731164ce919a358fb509388b8c34f70b84716aa99ceb2df8d6920cc3d4994daea454c0caf2200fb0ca30
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${SOURCE_PATH}/engine")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-engine
        CONFIG_PATH share/portal-engine
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()