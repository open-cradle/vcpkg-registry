set(CRADLE_COMMIT_HASH "12cee95c9c77591c2172a1ca8b4b04b4e7aa1115")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 6b2bb3c8cc5af72befc3c16e621f373e7f53ebac60cf15f4527dd26f46af83d9bda258ee42ee3fa6c0d7de3f64cbc3b544dddc183841249c4628224d9906726e)

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
