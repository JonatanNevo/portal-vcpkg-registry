vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/portal-framework
        REF 43009f157cd12a28d57ec9e97eb34a85c56c8ab8
        SHA512 0f797d6a663f03aded0a672d56be8353c5fee7dfae94dd83003e0b0ee10718c5462f824c6540c54aaa7cebf0ecdb68d07678a5f8f812467963ce9526b20517fd
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${SOURCE_PATH}/serialization")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-serialization
        CONFIG_PATH share/portal-serialization
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()