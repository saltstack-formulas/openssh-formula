# InSpec Profile: `share`

This shows the implementation of the `share` InSpec [profile](https://github.com/inspec/inspec/blob/master/docs/profiles.md).

It's goal is to share the libraries between all profiles.

## Libraries

### `system`

The `system` library provides easy access to system dependents informations:

- `system.platform`: take `inspec.platform` and mangle things a bit to be useful
  - `system.platform[:family]` provides a family name for Arch
  - `system.platform[:name]` modify `amazon` to `amazonlinux`
  - `system.platform[:release]` tweak for Arch and Amazon Linux:
    - `Arch` is always `base-later`
    - `Amazon Linux` release `2018` became `1`
  - `system.platform[:finger]` is just the concatenation of the name and the first release number (except for Ubuntu which gives `20.04` for example)
