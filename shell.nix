with (import ./haskell.nix);
let replica = fetchgit {
  url = "git@github.com:drownbes/replica.git";
  rev = "5ad6f2e965666a3fc5a37c4a84531e3b10361939";
};
in project.shellFor {
  withHoogle = true;
  buildInputs = [
    pkgs.haskellPackages.hpack
    pkgs.haskellPackages.fswatcher
    pkgs.zlib
  ];
  tools = {
    cabal = "3.2.0.0";
    hlint = "3.2.7";
    haskell-language-server = "latest";
  };
}
