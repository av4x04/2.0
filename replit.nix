{ pkgs }: {
  deps = [
    pkgs.zip
    pkgs.wget
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}