set(CRADLE_COMMIT_HASH "bbe069cae37a2806eb3a27baccc6984048508abf")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 3b8d30a17b970a0edb5f0248b3febfc2995dfc672068cdfd146f2e3266235d2ab599addfc5010a686e1fdfe6822bf0c62f30fafdf17d38e5fb9cae1e238c4ab1)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DCRADLE_VERSION=${VERSION}
    -DCRADLE_COMMIT_HASH=${CRADLE_COMMIT_HASH}
    -DCRADLE_PREPROCESSOR_USAGE=GitCache
    -DCRADLE_IS_MAIN_PROJECT=OFF
    -DCRADLE_ENABLE_TESTING=OFF
    -DCRADLE_INSTALL=ON)

vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
