{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          {
            devShells.default = pkgs.mkShell {
              buildInputs = with pkgs; [
                bashInteractive
                deno
                jupyter
              ];

              shellHook = ''
                export JUPYTER_DATA_DIR="$PWD/.jupyter"
                mkdir -p "$JUPYTER_DATA_DIR/kernels/deno"
                cat > "$JUPYTER_DATA_DIR/kernels/deno/kernel.json" <<EOF
                {
                  "argv": ["$(command -v deno)", "jupyter", "--kernel", "--conn", "{connection_file}"],
                  "display_name": "Deno",
                  "language": "typescript"
                }
                EOF
              '';
            };
          }
        );
}
