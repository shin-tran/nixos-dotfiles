# - NIXOS_DOTFILES_DIR: Đường dẫn đến thư mục dotfiles.
# - USER_CONFIG_DIR:    Đường dẫn đến thư mục .config của user.
# - CONFIG_NAMES:       Một chuỗi chứa tên các config, cách nhau bằng dấu cách.

# Đọc chuỗi cách nhau bằng dấu cách vào một mảng (array)
configs=($CONFIG_NAMES)

for config_name in "''${configs[@]}"; do
  sourceDir="$NIXOS_DOTFILES_DIR/config/$config_name"
  targetLink="$USER_CONFIG_DIR"

  if [ -d "$sourceDir" ]; then
    verboseEcho "Linking $sourceDir to $targetLink"
    run ln -sfn $VERBOSE_ARG "$sourceDir" "$targetLink"
  else
    verboseEcho "Config source $sourceDir not found, skipping link."
  fi
done
