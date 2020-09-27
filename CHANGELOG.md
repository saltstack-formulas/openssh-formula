# Changelog

## [2.0.4](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.3...v2.0.4) (2020-09-27)


### Bug Fixes

* **pillar:** `tofs` must not be under `mine_functions` ([c0d5052](https://github.com/saltstack-formulas/openssh-formula/commit/c0d5052f6a4f86ed78df5f79f4848f24113dbe1a))


### Tests

* **inspec:** `_mapdata` files should have `tofs` configuration ([5e9033f](https://github.com/saltstack-formulas/openssh-formula/commit/5e9033f500cfa0cc5c06867ebdccd9e6b3298498))

## [2.0.3](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.2...v2.0.3) (2020-09-09)


### Continuous Integration

* **kitchen:** force the hostname of the containers ([208f873](https://github.com/saltstack-formulas/openssh-formula/commit/208f87380ce23995ca62c882401c48ec91de6c86))


### Tests

* **inspec:** no more need to mangle mapdata for hostname ([8cb31c6](https://github.com/saltstack-formulas/openssh-formula/commit/8cb31c6967f736f2068ec55911bd177f5ad6ee87))
* **share:** standardise structure ([15241d3](https://github.com/saltstack-formulas/openssh-formula/commit/15241d39c55441c31ae19863cb383a0ccccaa07e))

## [2.0.2](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.1...v2.0.2) (2020-08-26)


### Tests

* **inspec:** display proper diff when `_mapdata` mismatch ([1c99556](https://github.com/saltstack-formulas/openssh-formula/commit/1c99556695a633c706d852dd20cfcc25397eba35))

## [2.0.1](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.0...v2.0.1) (2020-08-21)


### Bug Fixes

* **map:** `path_join` can be used only for local file access ([3845d5f](https://github.com/saltstack-formulas/openssh-formula/commit/3845d5ff618f936700d5180ce9ff11ba1b037bcc))

# [2.0.0](https://github.com/saltstack-formulas/openssh-formula/compare/v1.3.1...v2.0.0) (2020-08-01)


### Features

* **map:** `config.get` lookups from configurable roots ([ad4385b](https://github.com/saltstack-formulas/openssh-formula/commit/ad4385b077b1fe2b22ab5888ab6b598cb8478658))
* **map:** update to v4 “map.jinja” ([df477b2](https://github.com/saltstack-formulas/openssh-formula/commit/df477b25c27c521610a8809528ebcba038db673e))

## [1.3.1](https://github.com/saltstack-formulas/openssh-formula/compare/v1.3.0...v1.3.1) (2020-07-31)


### Bug Fixes

* **inspec:** use the name `_mapdata` everywhere for coherency ([14e843e](https://github.com/saltstack-formulas/openssh-formula/commit/14e843ec2b756923e13daf21a0dabe480e289339))

# [1.3.0](https://github.com/saltstack-formulas/openssh-formula/compare/v1.2.2...v1.3.0) (2020-07-30)


### Continuous Integration

* **kitchen:** execute `_mapdata` state ([70389b5](https://github.com/saltstack-formulas/openssh-formula/commit/70389b5964100cc964d3031dd652f547461a9ab2))


### Features

* **map:** generate a YAML file to validate `map.jinja` ([e4ab335](https://github.com/saltstack-formulas/openssh-formula/commit/e4ab3350773b79f84b6c36042d2015bd21bd9681))


### Tests

* **inspec:** share library to access some minion informations ([a8d61f4](https://github.com/saltstack-formulas/openssh-formula/commit/a8d61f43072485b8da289442b675fb84be93cf4d))
* **inspec:** verify `map.jinja` dump ([0eafbd9](https://github.com/saltstack-formulas/openssh-formula/commit/0eafbd945c1ccaa89eee305ac2f02adf8797a733))

## [1.2.2](https://github.com/saltstack-formulas/openssh-formula/compare/v1.2.1...v1.2.2) (2020-07-30)


### Bug Fixes

* **jinja:** omit_ip_address don't work on some platform ([b2d38ae](https://github.com/saltstack-formulas/openssh-formula/commit/b2d38aec9bd46a64965be0ecb66e7c912a1bf3c6))

## [1.2.1](https://github.com/saltstack-formulas/openssh-formula/compare/v1.2.0...v1.2.1) (2020-07-21)


### Bug Fixes

* **known_hosts:** dig package does not install on Arch ([0b667cb](https://github.com/saltstack-formulas/openssh-formula/commit/0b667cbcf5e6560d3e92dc5d36b6649c629bfcd7))


### Continuous Integration

* **kitchen:** execute `openssh.known_hosts` state ([644e616](https://github.com/saltstack-formulas/openssh-formula/commit/644e61651d1cee2bc6ea9f7fdc5a7a51ffe342ff))


### Tests

* **config_spec:** verify /etc/ssh/ssh_known_hosts ([06ef24b](https://github.com/saltstack-formulas/openssh-formula/commit/06ef24b8e15a8c27433c639846d88d11835209ec))

# [1.2.0](https://github.com/saltstack-formulas/openssh-formula/compare/v1.1.0...v1.2.0) (2020-07-20)


### Bug Fixes

* **inspec:** the package name for Arch is openssh ([6b7d8df](https://github.com/saltstack-formulas/openssh-formula/commit/6b7d8df1560091f615e2138a56d4cb8e50b7ab5c))
* **jinja:** encode context as json ([7a1f619](https://github.com/saltstack-formulas/openssh-formula/commit/7a1f6199d0ed32d6df6249ec9ec3710614642e62))


### Features

* **ci:** update travis and kitchen to latest formula standards ([7752132](https://github.com/saltstack-formulas/openssh-formula/commit/7752132275db8fa1e3faa0f58974dbb5d44fb0f8))


### Styles

* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] ([9d8228d](https://github.com/saltstack-formulas/openssh-formula/commit/9d8228d9dbd4d6affaf5084db26ba3f852724740))

# [1.1.0](https://github.com/saltstack-formulas/openssh-formula/compare/v1.0.0...v1.1.0) (2020-07-17)


### Bug Fixes

* **inspec:** make rubocop happy ([2cfb5a7](https://github.com/saltstack-formulas/openssh-formula/commit/2cfb5a74f32fa0f429b62a0c2053278859463418))


### Features

* **test:** remove serverspec files ([049db2b](https://github.com/saltstack-formulas/openssh-formula/commit/049db2bc8edbe224a6f47c623d7afe939e5b7992))

# [1.0.0](https://github.com/saltstack-formulas/openssh-formula/compare/v0.43.3...v1.0.0) (2020-07-17)


### Continuous Integration

* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([bb1ac71](https://github.com/saltstack-formulas/openssh-formula/commit/bb1ac717862a2c659800c4163a0d56f035c08ed7))


### Features

* **templates:** don't get openssh pillars in templates ([cb6e48f](https://github.com/saltstack-formulas/openssh-formula/commit/cb6e48feaad2649fd008bf71071e5b803b59628e))


### BREAKING CHANGES

* **templates:** Minimum Salt version support is now `2019.2` in line
with official upstream support; also use of the `traverse` Jinja filter.

## [0.43.3](https://github.com/saltstack-formulas/openssh-formula/compare/v0.43.2...v0.43.3) (2020-06-04)


### Bug Fixes

* **config_ini:** stop failing after the first application ([c7777c7](https://github.com/saltstack-formulas/openssh-formula/commit/c7777c74b27192d8d04a038e56db312d176ef08a))

## [0.43.2](https://github.com/saltstack-formulas/openssh-formula/compare/v0.43.1...v0.43.2) (2020-06-04)


### Bug Fixes

* **config_ini:** ensure the tab replacement happens before the edit ([b26b99d](https://github.com/saltstack-formulas/openssh-formula/commit/b26b99d3d0a48dfe1142b0a35a151b558b4d4b73)), closes [#162](https://github.com/saltstack-formulas/openssh-formula/issues/162)
* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] ([053b787](https://github.com/saltstack-formulas/openssh-formula/commit/053b7879fdfbf78e81b3d11100bc14e601fabc23))


### Continuous Integration

* **gemfile:** remove unused `rspec-retry` gem [skip ci] ([5be1c1f](https://github.com/saltstack-formulas/openssh-formula/commit/5be1c1f47cf07a308485153cf7f4b41af3d60221))
* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([e53bcc1](https://github.com/saltstack-formulas/openssh-formula/commit/e53bcc14dc28191d0294ff2947df97829e93f2d1))
* **kitchen+travis:** remove `master-py2-arch-base-latest` [skip ci] ([0977485](https://github.com/saltstack-formulas/openssh-formula/commit/0977485b6b615fb3eb86f4265413f04f8048329b))
* **travis:** add notifications => zulip [skip ci] ([597aeb5](https://github.com/saltstack-formulas/openssh-formula/commit/597aeb586191effc16269c9cb28ef6d723b68781))
* **workflows/commitlint:** add to repo [skip ci] ([fa6c65b](https://github.com/saltstack-formulas/openssh-formula/commit/fa6c65b852ef77431eaf90a73db987dc641382c3))

## [0.43.1](https://github.com/saltstack-formulas/openssh-formula/compare/v0.43.0...v0.43.1) (2020-02-07)


### Continuous Integration

* **gemfile:** update for Vagrant testing [skip ci] ([7257ade](https://github.com/saltstack-formulas/openssh-formula/commit/7257adefee8c19a477b315a15ab93679baf877bb))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([ddbc3b2](https://github.com/saltstack-formulas/openssh-formula/commit/ddbc3b228b09301c6a1d9030d8341f2638de077c))


### Tests

* **packages_spec:** prevent control for `bsd` family ([fe1af09](https://github.com/saltstack-formulas/openssh-formula/commit/fe1af098b3a84f2695a67fbc2ac416b6ab5f1dc6))

# [0.43.0](https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.3...v0.43.0) (2020-01-20)


### Bug Fixes

* **release.config.js:** use full commit hash in commit link [skip ci] ([0f68f19](https://github.com/saltstack-formulas/openssh-formula/commit/0f68f1957e6a49b5b06d85672dc2f57f33660416))


### Continuous Integration

* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([14787d1](https://github.com/saltstack-formulas/openssh-formula/commit/14787d1d3ed6ddc1c62f615688aa838a02336d96))
* **kitchen:** add pre-salted `FreeBSD-12.0` box for local testing ([ec81c32](https://github.com/saltstack-formulas/openssh-formula/commit/ec81c32210c40d5c53f54b5b657b9be5aa0fb2d9))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([d22ac05](https://github.com/saltstack-formulas/openssh-formula/commit/d22ac056e5b557cb77644fc3fd1dcd405f16949a))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([3aa890e](https://github.com/saltstack-formulas/openssh-formula/commit/3aa890eff78fc0fecea4d9bc0be89aff22f6b7f3))
* **travis:** apply changes from build config validation [skip ci] ([8bdd13f](https://github.com/saltstack-formulas/openssh-formula/commit/8bdd13fd0f2fe137d09611bd310574ab8bc0c4e1))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([2802793](https://github.com/saltstack-formulas/openssh-formula/commit/28027937f8699273fec849eab5b8c74ce7778ea1))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([fa3b9a3](https://github.com/saltstack-formulas/openssh-formula/commit/fa3b9a342e3f483f62aaeb73c5fe3e589ff9878c))
* **travis:** run `shellcheck` during lint job [skip ci] ([cd91262](https://github.com/saltstack-formulas/openssh-formula/commit/cd9126248c5c27646c8aab0eb4cb0e6ffe189535))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([dfaeb8f](https://github.com/saltstack-formulas/openssh-formula/commit/dfaeb8f505e814d996bc8a2432a4ccee414af4fc))
* **travis:** use build config validation (beta) [skip ci] ([840ab6a](https://github.com/saltstack-formulas/openssh-formula/commit/840ab6a2fc0a6569baf91a4af589e4a43d639d48))


### Features

* **ssh_known_hosts:** allow to omit IP addresses ([ea221ab](https://github.com/saltstack-formulas/openssh-formula/commit/ea221ab52b0bd77173e83f5eb8b116324ad7c280))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([875148b](https://github.com/saltstack-formulas/openssh-formula/commit/875148b387f37533e5d43b72142f4078b7dd432a))

## [0.42.3](https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.2...v0.42.3) (2019-10-27)


### Continuous Integration

* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/5d3f92c))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/88fed56))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/openssh-formula/commit/41d712f))


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/b564d8d))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/8eaf5e4))


### Tests

* **inspec:** fix `config_spec` tests on *BSD (`wheel` not `root`) ([](https://github.com/saltstack-formulas/openssh-formula/commit/047b753))

## [0.42.2](https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.1...v0.42.2) (2019-10-09)


### Bug Fixes

* **config.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/openssh-formula/commit/7e35335))
* **map.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/openssh-formula/commit/55560a6))


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([](https://github.com/saltstack-formulas/openssh-formula/commit/4ca3ca1))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/1b236db))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/32dd705))
* **platform:** add `arch-base-latest` (commented out for now) [skip ci] ([](https://github.com/saltstack-formulas/openssh-formula/commit/4644018))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/openssh-formula/commit/72ade05))

## [0.42.1](https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.0...v0.42.1) (2019-09-16)


### Tests

* **inspec:** add tests based on existing Serverspec tests ([#168](https://github.com/saltstack-formulas/openssh-formula/issues/168)) ([267042c](https://github.com/saltstack-formulas/openssh-formula/commit/267042c)), closes [/travis-ci.org/myii/openssh-formula/jobs/585340845#L1811-L1813](https://github.com//travis-ci.org/myii/openssh-formula/jobs/585340845/issues/L1811-L1813) [/travis-ci.org/myii/openssh-formula/jobs/585356835#L2957-L2965](https://github.com//travis-ci.org/myii/openssh-formula/jobs/585356835/issues/L2957-L2965) [#166](https://github.com/saltstack-formulas/openssh-formula/issues/166)

# [0.42.0](https://github.com/saltstack-formulas/openssh-formula/compare/v0.41.0...v0.42.0) (2019-09-13)


### Features

* **semantic-release:** implement for this formula ([6300ddf](https://github.com/saltstack-formulas/openssh-formula/commit/6300ddf)), closes [#165](https://github.com/saltstack-formulas/openssh-formula/issues/165)
