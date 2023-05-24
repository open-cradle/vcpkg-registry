set(CRADLE_COMMIT_HASH "211d7bf09b1cafe1d620f9a9f7cce7576f1920b1")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  REF ${CRADLE_COMMIT_HASH}
  SHA512 e8aac5944ad3c1e23db79b8b16ff50522f777e057d4a57225f4b07f5560ee35983b2f22b6c1308acb7bad67b4a8cb111a4622271975898c35cb071c784db0ff5)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DCRADLE_USE_CONAN=OFF
    -DCRADLE_SUPPORT_VCPKG=ON
    -DCRADLE_IS_MAIN_PROJECT=OFF
    -DCRADLE_PREPROCESSOR_USAGE=GitCache
    -DCRADLE_COMMIT_HASH=${CRADLE_COMMIT_HASH})

vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
