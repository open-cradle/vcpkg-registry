set(CRADLE_COMMIT_HASH "beea78dbefbad0cdf2dcaee0dd183f7fe5cd89b4")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 a7d6e836afe091d6135f1b57060dc386d98f8389c4ad776f75dd73a5f369488bb580f374e8bc005a54fbf960faf427475a090a91e5086fab76865e50fc0f0028)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DCRADLE_VERSION=${VERSION}
    -DCRADLE_COMMIT_HASH=${CRADLE_COMMIT_HASH}
    -DCRADLE_PREPROCESSOR_USAGE=GitCache
    -DCRADLE_IS_MAIN_PROJECT=OFF
    -DCRADLE_ENABLE_TESTING=OFF
    -DCRADLE_INSTALL=ON
    # Override vcpkg's attempt to disable FetchContent.
    # (We only use FetchContent for cppcoro, so in the future it would be nice
    # to get this through vcpkg as well.)
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
  PACKAGE_NAME "cradle"
  CONFIG_PATH "lib/cmake/cradle")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
