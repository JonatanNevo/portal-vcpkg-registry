vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF af8e1bad340b7689964a3b592cad642c0965c089
        SHA512 c68f00ec54f7d4aa1e59fc5dde8399e961d6e40a984d2d5adc19dd673b590b2bb08f45cf303f3265499d1aaff5fbd6355c33e0b3da92b01a5aeeaf7d27222df1
        HEAD_REF fix/vcpkg-packaging
)

set(SOURCE_PATH "${REPO_ROOT_PATH}/core")

set(FEATURE_OPTIONS "")
if("tests" IN_LIST FEATURES)
    list(APPEND FEATURE_OPTIONS -DPORTAL_BUILD_TESTS=ON)
else()
    list(APPEND FEATURE_OPTIONS -DPORTAL_BUILD_TESTS=OFF)
endif()

if("profile" IN_LIST FEATURES)
    list(APPEND FEATURE_OPTIONS -DPORTAL_PROFILE=ON)
endif()

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        OPTIONS
        -DPORTAL_FIND_PACKAGE=ON
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME portal-core
        CONFIG_PATH share/portal-core
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${REPO_ROOT_PATH}/LICENSE")