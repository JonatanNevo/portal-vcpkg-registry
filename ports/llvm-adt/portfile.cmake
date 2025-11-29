vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF 6a641e2a2058567f212244740f9ddb7028616276
        SHA512 e2bea09c17114c9551a206cbee1ec8602851de065c8f0cbb6e1ba8445148a043814959cb65d47a8b436858c422f5b4c10b132e46e3b1891cb4c687431dc3cdf4
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${SOURCE_PATH}/llvm-adt")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME llvm-adt
        CONFIG_PATH share/llvm-adt
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()