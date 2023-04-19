vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO open-cradle/cradle
  # TODO: REF 71b11aeabdb92b5269270c3c8953a58c6e108818
  # TODO: SHA512 0
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
