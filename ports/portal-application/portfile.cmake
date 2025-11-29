vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF cabe283a7668502118330f8fe42003cc620c88ee
        SHA512 33709f700f0e0a8567ef9f155d1811d386c84974511ac7d14a1c83cb8297329ea4d8c40157f94af047d9bc2b72451edb7bcacc2ab408f6ee8ca82d03220a0bb4
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${SOURCE_PATH}/application")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-application
        CONFIG_PATH share/portal-application
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()