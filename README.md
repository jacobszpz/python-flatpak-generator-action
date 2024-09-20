# Python Flatpak Generator Action

A really niche action that will:

1. Set up python
2. Clone a repository containing a flatpak manifest repository for a Python app
3. Run flatpak-pip-generator on the current repository's requirements.txt (or Pipfile)

Additionally:

4. If detected, run flatpak-cargo-generator on pydantic-core
5. If desired, run flatpak-cargo-generator on maturin (version provided)

Finally:

6. Place the generated files on the flatpak manifest repository locally

The last step is to commit these changes, which is something this action does not cover,
but should be trivial.

## Usage
```yaml
- uses: jacobszpz/python-flatpak-generator-action@v1
  env:
    MATURIN_REF: v1.2.3
    SETUPTOOLS_RUST_REF: v1.7.0
  with:
    flatpak-repo: 'user/flathub'
    flatpak-repo-branch: 'yourbranch'
    flatpak-repo-secret: ${{ secrets.YOUR_SECRET }}
    use-pipfile: true
    from-pipfile: true
    python-version: '3.10.10'
    maturin-version: ${{ env.MATURIN_REF }}
    setuptools-rust-version: ${{ env.SETUPTOOLS_RUST_REF }}
```
By default, maturin-version / setuptools-rust-version will not take effect unless you specify them.

## Why?
~~I dunno~~

Really though, pydantic has wrecked havoc on my build process by needing to be built with maturin and this action addresses just this specific problem.
It may be helpful if you, like me, have been affected by pydantic or any other python library built with Rust, though you will need to modify the action if the latter is true.

If you do wish to contribute, feel free to request support for a specific use case and if it is useful enough I will add it.
On the flip side, for those python projects which do not require any crazy stunts, this should still make it easier to generate the flatpak sources on CI.

## License
MIT
