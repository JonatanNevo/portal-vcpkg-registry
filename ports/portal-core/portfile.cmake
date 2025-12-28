vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 726ec509c27efc9e5bdd21b13ea8f495b6f34f37
        SHA512 107e04be472392c3700f1e0df420368f52fd91c9167cdc148126887148565ff4e6277e70acca9da4decaf725be6920850847d0c1318018c54eee3e9aeabb3175
        HEAD_REF main
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