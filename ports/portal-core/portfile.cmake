vcpkg_from_github(
        OUT_SOURCE_PATH REPO_ROOT_PATH
        REPO JonatanNevo/portal-framework
        REF 448116cc9371d29e4c120edaa659c37beb5ddb72
        SHA512 4995f92f08b3a96912093cc5a0cccbb65f7167c04ee5ddb62f11ea144f6f77ae42eb3092d4a50f6b5e5112c97cf322fafe76216483f177d0b83a2c986c781553
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