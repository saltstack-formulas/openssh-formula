# Changelog

## [3.0.4](https://github.com/saltstack-formulas/openssh-formula/compare/v3.0.3...v3.0.4) (2025-06-09)


### Bug Fixes

* **sshd_config:** remove special newline handling for auth options ([3d2442f](https://github.com/saltstack-formulas/openssh-formula/commit/3d2442f3c6eb4ebb46fad8f933d2b5b5b3e6d9e3))


### Continuous Integration

* **pre-commit.ci:** perform `pre-commit` autoupdate ([a09a0b2](https://github.com/saltstack-formulas/openssh-formula/commit/a09a0b258dff3111839e72e6538a879db5b39783))
* **vagrant:** remove testing for unsupported OSes ([f214ad0](https://github.com/saltstack-formulas/openssh-formula/commit/f214ad03aa0c823a1f2a8b4d46f11ee41dba4bab))
* update `pre-commit` configuration inc. for pre-commit.ci [skip ci] ([b29b10d](https://github.com/saltstack-formulas/openssh-formula/commit/b29b10de7dae0a4cc3e9f6ebb3e1e5d758db3997))
* **kitchen+gitlab:** update for new pre-salted images [skip ci] ([f2c7d39](https://github.com/saltstack-formulas/openssh-formula/commit/f2c7d392ca261542df5dd098150bd8dfa724bc6d))
* **vagrant:** use `linked_clone` at all times (inc. CI) [skip ci] ([917b3a1](https://github.com/saltstack-formulas/openssh-formula/commit/917b3a17c3e688b0a3bc6443ad868a7153d91a46))


### Tests

* **_mapdata:** add verification file for `fedora-35` [skip ci] ([c6b6556](https://github.com/saltstack-formulas/openssh-formula/commit/c6b655611759e6d2ec74ab69c4348ba56af6634c))
* **pillar:** add `ssh-rsa` Kitchen workaround on Fedora 36 [skip ci] ([24b29cd](https://github.com/saltstack-formulas/openssh-formula/commit/24b29cd91ca6cd8020558b5d880a2104d7dabf3d))
* **pillar:** add `ssh-rsa` Kitchen workaround on Ubuntu 22.04 [skip ci] ([2419d26](https://github.com/saltstack-formulas/openssh-formula/commit/2419d26e02ba6ef206e53ec99465c0e48b84a53e))
* **system.rb:** add support for `mac_os_x` [skip ci] ([9fb9426](https://github.com/saltstack-formulas/openssh-formula/commit/9fb94264a5805342f2bbe7c9cad826b87f8a5e1d))

## [3.0.3](https://github.com/saltstack-formulas/openssh-formula/compare/v3.0.2...v3.0.3) (2022-02-21)


### Bug Fixes

* **libmapstack:** allow mapping by booleans and numbers ([40ba5a7](https://github.com/saltstack-formulas/openssh-formula/commit/40ba5a72c6476fa7deb4e73a01e78530da4c45d9))


### Continuous Integration

* update linters to latest versions [skip ci] ([81f97c0](https://github.com/saltstack-formulas/openssh-formula/commit/81f97c0457b7b30a6464c066fcb83ca77def9371))


### Styles

* **libsaltcli:** fix comments to jinja comments [skip ci] ([3416d94](https://github.com/saltstack-formulas/openssh-formula/commit/3416d94a36ab0c38942dba8d660652592f74a019))


### Tests

* **system:** add `build_platform_codename` [skip ci] ([aaa1828](https://github.com/saltstack-formulas/openssh-formula/commit/aaa1828f8683cb306b4532805d8095b095649af5))

## [3.0.2](https://github.com/saltstack-formulas/openssh-formula/compare/v3.0.1...v3.0.2) (2022-02-03)


### Bug Fixes

* **libmatchers:** python client API can use `config.get` options ([560a5cc](https://github.com/saltstack-formulas/openssh-formula/commit/560a5ccbbc1c657fce621da945981cd0bd701879))


### Code Refactoring

* **map.jinja:** standardise v5 structure [skip ci] ([3162842](https://github.com/saltstack-formulas/openssh-formula/commit/3162842ec5531b72a28fff592e1b63d33aa2cd59))


### Continuous Integration

* **3003.1:** update inc. AlmaLinux, Rocky & `rst-lint` [skip ci] ([7190129](https://github.com/saltstack-formulas/openssh-formula/commit/719012908469f50e510779e1b82fb5605f54053a))
* **freebsd:** update with latest pre-salted Vagrant boxes [skip ci] ([943cf17](https://github.com/saltstack-formulas/openssh-formula/commit/943cf1790370fa32d19f6e367510d513fc9cbbb6))
* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] ([8b2cd1b](https://github.com/saltstack-formulas/openssh-formula/commit/8b2cd1b0e6a872928d2095170e9524274c9de3e2))
* **gemfile+lock:** use `ssf` customised `inspec` repo [skip ci] ([e5d83f3](https://github.com/saltstack-formulas/openssh-formula/commit/e5d83f3f36152c57c6701fdb5d28b624830dc8e0))
* **kitchen:** move `provisioner` block & update `run_command` [skip ci] ([1685782](https://github.com/saltstack-formulas/openssh-formula/commit/168578285aa3291c4cca775daae299aa0889f1d5))
* **kitchen+ci:** update with `3004` pre-salted images/boxes [skip ci] ([e59160f](https://github.com/saltstack-formulas/openssh-formula/commit/e59160f8461386c148b8e61f43e4c3a0d0b89587))
* **kitchen+ci:** update with latest `3003.2` pre-salted images [skip ci] ([d48bdde](https://github.com/saltstack-formulas/openssh-formula/commit/d48bdde2c6919d73a79301f46ec058668d413aac))
* **kitchen+ci:** update with latest CVE pre-salted images [skip ci] ([5d4ed95](https://github.com/saltstack-formulas/openssh-formula/commit/5d4ed95572dbdb7b93c2ff3cafca71ed8a6a4034))
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] ([b7ddbb0](https://github.com/saltstack-formulas/openssh-formula/commit/b7ddbb0e186b74d5c9ae0abd75b187f08aab896e))
* **kitchen+gitlab:** update for new pre-salted images [skip ci] ([eede9fa](https://github.com/saltstack-formulas/openssh-formula/commit/eede9fa54c84b92aab2f7c036e41f53df1389e0c))
* **vagrant:** replace FreeBSD 12.2 with 12.3 [skip ci] ([5e8a886](https://github.com/saltstack-formulas/openssh-formula/commit/5e8a88631351c1621da415bc0decae808b9bfc1b))
* add Debian 11 Bullseye & update `yamllint` configuration [skip ci] ([efb6799](https://github.com/saltstack-formulas/openssh-formula/commit/efb679941a6940b1e94a1b0b3fdbaa25ff3f5d12))
* **vagrant:** add OpenBSD 6.9 [skip ci] ([fb78927](https://github.com/saltstack-formulas/openssh-formula/commit/fb789274811a3acce1589280137fab8dd78cd0d2))
* add `arch-master` to matrix and update `.travis.yml` [skip ci] ([1af42b2](https://github.com/saltstack-formulas/openssh-formula/commit/1af42b215e96715f3ddeae13aab6fcbbcfd258b4))
* **kitchen+gitlab:** adjust matrix to add `3003` [skip ci] ([c82927f](https://github.com/saltstack-formulas/openssh-formula/commit/c82927fbc8dd40aea584c6fbee2a5d08eac7c31e))
* **vagrant:** add FreeBSD 13.0 [skip ci] ([7c69859](https://github.com/saltstack-formulas/openssh-formula/commit/7c698591c862c412894416f5037892f13f2ed514))
* **vagrant:** use pre-salted boxes & conditional local settings [skip ci] ([531de16](https://github.com/saltstack-formulas/openssh-formula/commit/531de164b66ef66b66fadd2369ad302916131e39))


### Documentation

* **readme:** fix headings [skip ci] ([52abade](https://github.com/saltstack-formulas/openssh-formula/commit/52abade1821ba7afa1ed313ba9a4d8250283938b))


### Tests

* **_mapdata:** add verification file for `debian-11` [skip ci] ([42e17b2](https://github.com/saltstack-formulas/openssh-formula/commit/42e17b28712b3bf369ac4629b21705a54c5763d6))
* **_mapdata:** add verification file for `fedora-34` [skip ci] ([3f6c4a0](https://github.com/saltstack-formulas/openssh-formula/commit/3f6c4a05acbf5b41b771b4a44a897e7353190efa))
* **alma+rocky:** add platforms (based on CentOS 8) [skip ci] ([2dc565b](https://github.com/saltstack-formulas/openssh-formula/commit/2dc565b7c7a467b55e199e47e0d5fe4486360e34))
* **default:** use `grains.get` for `oscodename` (for FreeBSD) [skip ci] ([aa8f9db](https://github.com/saltstack-formulas/openssh-formula/commit/aa8f9dbfd6e534e53557b4ae917a90951f8714ac))
* **freebsd:** add `map.jinja` verification file (for 13.0) ([018a47c](https://github.com/saltstack-formulas/openssh-formula/commit/018a47cdd89dac21c05265db7cb5ee8ec9bd0ada))
* **pillar:** add `ssh-rsa` Kitchen workaround on Arch Linux [skip ci] ([ecd62e4](https://github.com/saltstack-formulas/openssh-formula/commit/ecd62e45075c19bce13d42d88c9372c1a308699f))
* **pillar:** add `ssh-rsa` Kitchen workaround on Gentoo [skip ci] ([d65ea55](https://github.com/saltstack-formulas/openssh-formula/commit/d65ea55d94d1cd314412daa6388eda080ab70725))
* **pillar:** add platforms to `ssh-rsa` Kitchen workaround [skip ci] ([6260e85](https://github.com/saltstack-formulas/openssh-formula/commit/6260e852800a3a5481cc0df73a5f689a48599ea2))

## [3.0.1](https://github.com/saltstack-formulas/openssh-formula/compare/v3.0.0...v3.0.1) (2021-03-26)


### Bug Fixes

* **openbsd:** fix `dig_pkg`, avoid `UsePAM` & add verification file ([2868560](https://github.com/saltstack-formulas/openssh-formula/commit/286856058ac1b7231cbd3455826a751963c3ca45))


### Continuous Integration

* enable Vagrant-based testing using GitHub Actions ([f1af455](https://github.com/saltstack-formulas/openssh-formula/commit/f1af45593d967c9ac734702fa31b922d28053d32))
* **gemfile+lock:** use `ssf` customised `kitchen-docker` repo [skip ci] ([01512a0](https://github.com/saltstack-formulas/openssh-formula/commit/01512a0ec47b42ea41fcc949f59372b7e95e817c))
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] ([79321be](https://github.com/saltstack-formulas/openssh-formula/commit/79321be76fa91234414dd53ea81ee0327276bafe))
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] ([c2a366f](https://github.com/saltstack-formulas/openssh-formula/commit/c2a366f9c721fc0956cd08c5e3f239a751be7a10))
* **pre-commit:** update hook for `rubocop` [skip ci] ([ccb6a44](https://github.com/saltstack-formulas/openssh-formula/commit/ccb6a4487580eb75b3d735e7cfb398f2b8ebb316))


### Documentation

* **readme:** add `Testing with Vagrant` section ([2f8c31c](https://github.com/saltstack-formulas/openssh-formula/commit/2f8c31c66c56d7c7626c5193d7386cc280e16322))


### Tests

* **freebsd:** add `map.jinja` verification files (for 11.4 & 12.2) ([4c857fe](https://github.com/saltstack-formulas/openssh-formula/commit/4c857fe07156260a206c9d33c7a87ce60a324803))
* standardise use of `share` suite & `_mapdata` state [skip ci] ([35a2124](https://github.com/saltstack-formulas/openssh-formula/commit/35a2124a43da14c8cb64040b0b5f2d1b4b7545fe))
* **_mapdata:** add verification files for new platforms ([748eded](https://github.com/saltstack-formulas/openssh-formula/commit/748ededc7af79b792cac8fa01abcd20c8c27d8ed))
* **share:** standardise with latest changes [skip ci] ([de969f1](https://github.com/saltstack-formulas/openssh-formula/commit/de969f10f1b22a86491f1b33d1d06eb7d721a980))

# [3.0.0](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.6...v3.0.0) (2021-01-12)


### Code Refactoring

* **map:** compound matchers like parsing with `libmatchers` ([925c86e](https://github.com/saltstack-formulas/openssh-formula/commit/925c86ea698c68f684ba1645a58c88d688e6acc5))
* **map:** load `defaults.jinja` configuration with `libmapstack` ([174bb68](https://github.com/saltstack-formulas/openssh-formula/commit/174bb68432366a449a8327a9dbb648271f123224))
* **map:** load `map.jinja` configuration with `libmapstack` ([568bb7c](https://github.com/saltstack-formulas/openssh-formula/commit/568bb7ce4075ee376e8c49a45a1470d252f82ab9))
* **map:** load formula configuration with `libmatchers` ([ff6b56c](https://github.com/saltstack-formulas/openssh-formula/commit/ff6b56c4a4e282f41ddfc8f379f95096fea0553f))


### Documentation

* **map:** document the new `map.jinja` with targeting like syntax ([7ecb24b](https://github.com/saltstack-formulas/openssh-formula/commit/7ecb24bdc1ff84ddac4c7c3e5d8d70c7512f4fb5))


### Features

* **map:** use targeting like syntax for configuration ([1be0d87](https://github.com/saltstack-formulas/openssh-formula/commit/1be0d8725ad933034f4e87cc9636bcc5100bd55c))
* **matchers:** add delimiter option for source definitions ([d69556d](https://github.com/saltstack-formulas/openssh-formula/commit/d69556d5ae79a907d79351d4b9775e0ce2970b39))


### Styles

* **mapstack:** variables in macro can't be exported ([7de2d6f](https://github.com/saltstack-formulas/openssh-formula/commit/7de2d6fd756b3e4b7154e660b639d7ce6edb8cfe))


### BREAKING CHANGES

* **map:** the configuration `map_jinja:sources` is only
                 configurable with `salt://parameters/map_jinja.yaml`
		 and `salt://{{ tplroot }}/parameters/map_jinja.yaml`
* **map:** the `map_jinja:config_get_roots` is replaced by
                 compound like `map_jinja:sources`
* **map:** the two `config_get_lookup` and `config_get` are
                 replaced by `C@<tplroot>:lookup` and `C@<tplroot>`
		 sources

## [2.0.6](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.5...v2.0.6) (2020-12-23)


### Code Refactoring

* **map:** use top-level `values:` key in `map.jinja` dumps ([37597e5](https://github.com/saltstack-formulas/openssh-formula/commit/37597e5b12c769be5add3608152215d7d21e8412))

## [2.0.5](https://github.com/saltstack-formulas/openssh-formula/compare/v2.0.4...v2.0.5) (2020-12-22)


### Continuous Integration

* **commitlint:** ensure `upstream/master` uses main repo URL [skip ci] ([7af3bf2](https://github.com/saltstack-formulas/openssh-formula/commit/7af3bf255df5d636750edb8b3a95c63b032712b4))
* **gitlab-ci:** add `rubocop` linter (with `allow_failure`) [skip ci] ([37b9f3a](https://github.com/saltstack-formulas/openssh-formula/commit/37b9f3ac09a895b6aad5e796f062c6f3871e697c))
* **gitlab-ci:** use GitLab CI as Travis CI replacement ([bccd5fd](https://github.com/saltstack-formulas/openssh-formula/commit/bccd5fd3d88ba22d1b9b91018e7eb2a24620138f))
* **pre-commit:** add to formula [skip ci] ([4e13609](https://github.com/saltstack-formulas/openssh-formula/commit/4e13609b992d5d2e3e2a540e736016fe1f22c7e2))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([094bef5](https://github.com/saltstack-formulas/openssh-formula/commit/094bef540614043947434a00b0a0e8bfe4665f93))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([75e843a](https://github.com/saltstack-formulas/openssh-formula/commit/75e843a7bdabcc64f29bcea7e7ae6ce204bd5397))


### Tests

* **map:** standardise `map.jinja` verification ([2bab68f](https://github.com/saltstack-formulas/openssh-formula/commit/2bab68f5ff5485c9b43712bd2dd17f447ed787f4))

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
