set(CRADLE_COMMIT_HASH "fea912e593db0d5662522a1e9d2c30e007cf7540")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 75f3bcff09a9b177c66a73f48012a3554568d48c44b2208b997cca473a9f305a118d7931f0902f93e86aa6a7abe4babf26a635d894cee14a6aeb4ba1f44e78c4)

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
vcpkg_cmake_config_fixup()

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
