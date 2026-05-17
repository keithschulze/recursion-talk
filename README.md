# Recursion and Corecursion talk

Talk and jupyter notebook exploring recursion and corecursion in typescript.

## Running the notebook

The dev environment is provided by a Nix flake. With Nix flakes enabled:

```sh
nix develop
jupyter lab folds.ipynb
```

The flake's `shellHook` registers a project-local Deno jupyter kernel under
`.jupyter/kernels/deno` pointing at the `deno` binary on `PATH`, so the notebook
will pick it up automatically.
