let
  sources = import ./nix/sources.nix {};
  haskellNix = import sources.haskellNix {};
  pkgs = import
  haskellNix.sources.nixpkgs-2105
  haskellNix.nixpkgsArgs;
in {
  project = pkgs.haskell-nix.project {
    projectFileName = "cabal.project";
    src = pkgs.haskell-nix.haskellLib.cleanGit {
      name = "concur-replica";
      src = ./.;
    };
    compiler-nix-name = "ghc865";
  };
  pkgs= pkgs;
}
