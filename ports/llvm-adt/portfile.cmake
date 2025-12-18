vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JonatanNevo/llvm-adt
        REF 623a6e269841e1fb5cf7e527c203b609982c19d8
        SHA512 b3817b9de81f7f8121da794cef64047705dc97b7bd21ef90a46e69807d47a20046d7cfc352b4c79a892174069f0f890540e26168c80a7c131d537ed168739c68
        HEAD_REF head
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME llvm-adt
        CONFIG_PATH share/llvm-adt
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")