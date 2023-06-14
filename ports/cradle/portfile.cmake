set(CRADLE_COMMIT_HASH "262878d33b24d0ce5740e499fba66ce095bb4746")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 519d5b49cafc988de9446c17cab8d4aff6400cb64f81b4fc88b3425db414c43f24a343cc0dcf377463d50edb0268446a2fbf362fbd4029b2d2bb45a2ef4455b6)

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
