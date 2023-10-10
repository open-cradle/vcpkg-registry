set(CRADLE_COMMIT_HASH "a3d639b6a0200e802d0aab2429c3f328ae03c629")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 04a823efcffabc991fdb521297bb850eb254a890a01320ff5a35217cbeaebe54027271a260b1180086da004243761ef0dc788a52aff11ca4bb54020f6747ea5c)

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
