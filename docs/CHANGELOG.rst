
Changelog
=========

`0.43.1 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.43.0...v0.43.1>`_ (2020-02-07)
------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** update for Vagrant testing [skip ci] (\ `7257ade <https://github.com/saltstack-formulas/openssh-formula/commit/7257adefee8c19a477b315a15ab93679baf877bb>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `ddbc3b2 <https://github.com/saltstack-formulas/openssh-formula/commit/ddbc3b228b09301c6a1d9030d8341f2638de077c>`_\ )

Tests
^^^^^


* **packages_spec:** prevent control for ``bsd`` family (\ `fe1af09 <https://github.com/saltstack-formulas/openssh-formula/commit/fe1af098b3a84f2695a67fbc2ac416b6ab5f1dc6>`_\ )

`0.43.0 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.3...v0.43.0>`_ (2020-01-20)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **release.config.js:** use full commit hash in commit link [skip ci] (\ `0f68f19 <https://github.com/saltstack-formulas/openssh-formula/commit/0f68f1957e6a49b5b06d85672dc2f57f33660416>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `14787d1 <https://github.com/saltstack-formulas/openssh-formula/commit/14787d1d3ed6ddc1c62f615688aa838a02336d96>`_\ )
* **kitchen:** add pre-salted ``FreeBSD-12.0`` box for local testing (\ `ec81c32 <https://github.com/saltstack-formulas/openssh-formula/commit/ec81c32210c40d5c53f54b5b657b9be5aa0fb2d9>`_\ )
* **kitchen:** use ``develop`` image until ``master`` is ready (\ ``amazonlinux``\ ) [skip ci] (\ `d22ac05 <https://github.com/saltstack-formulas/openssh-formula/commit/d22ac056e5b557cb77644fc3fd1dcd405f16949a>`_\ )
* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release [skip ci] (\ `3aa890e <https://github.com/saltstack-formulas/openssh-formula/commit/3aa890eff78fc0fecea4d9bc0be89aff22f6b7f3>`_\ )
* **travis:** apply changes from build config validation [skip ci] (\ `8bdd13f <https://github.com/saltstack-formulas/openssh-formula/commit/8bdd13fd0f2fe137d09611bd310574ab8bc0c4e1>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `2802793 <https://github.com/saltstack-formulas/openssh-formula/commit/28027937f8699273fec849eab5b8c74ce7778ea1>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `fa3b9a3 <https://github.com/saltstack-formulas/openssh-formula/commit/fa3b9a342e3f483f62aaeb73c5fe3e589ff9878c>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `cd91262 <https://github.com/saltstack-formulas/openssh-formula/commit/cd9126248c5c27646c8aab0eb4cb0e6ffe189535>`_\ )
* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `dfaeb8f <https://github.com/saltstack-formulas/openssh-formula/commit/dfaeb8f505e814d996bc8a2432a4ccee414af4fc>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `840ab6a <https://github.com/saltstack-formulas/openssh-formula/commit/840ab6a2fc0a6569baf91a4af589e4a43d639d48>`_\ )

Features
^^^^^^^^


* **ssh_known_hosts:** allow to omit IP addresses (\ `ea221ab <https://github.com/saltstack-formulas/openssh-formula/commit/ea221ab52b0bd77173e83f5eb8b116324ad7c280>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `875148b <https://github.com/saltstack-formulas/openssh-formula/commit/875148b387f37533e5d43b72142f4078b7dd432a>`_\ )

`0.42.3 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.2...v0.42.3>`_ (2019-10-27)
------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** use ``debian-10-master-py3`` instead of ``develop`` [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/5d3f92c>`_\ )
* **travis:** update ``salt-lint`` config for ``v0.0.10`` [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/88fed56>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/41d712f>`_\ )

Documentation
^^^^^^^^^^^^^


* **contributing:** remove to use org-level file instead [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/b564d8d>`_\ )
* **readme:** update link to ``CONTRIBUTING`` [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/8eaf5e4>`_\ )

Tests
^^^^^


* **inspec:** fix ``config_spec`` tests on *BSD (\ ``wheel`` not ``root``\ ) (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/047b753>`_\ )

`0.42.2 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.1...v0.42.2>`_ (2019-10-09)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **config.sls:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/7e35335>`_\ )
* **map.jinja:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/55560a6>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** change ``log_level`` to ``debug`` instead of ``info`` (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/4ca3ca1>`_\ )
* **kitchen:** install required packages to bootstrapped ``opensuse`` [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/1b236db>`_\ )
* **kitchen:** use bootstrapped ``opensuse`` images until ``2019.2.2`` [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/32dd705>`_\ )
* **platform:** add ``arch-base-latest`` (commented out for now) [skip ci] (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/4644018>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/openssh-formula/commit/72ade05>`_\ )

`0.42.1 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.42.0...v0.42.1>`_ (2019-09-16)
------------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **inspec:** add tests based on existing Serverspec tests (\ `#168 <https://github.com/saltstack-formulas/openssh-formula/issues/168>`_\ ) (\ `267042c <https://github.com/saltstack-formulas/openssh-formula/commit/267042c>`_\ ), closes `/travis-ci.org/myii/openssh-formula/jobs/585340845#L1811-L1813 <https://github.com//travis-ci.org/myii/openssh-formula/jobs/585340845/issues/L1811-L1813>`_ `/travis-ci.org/myii/openssh-formula/jobs/585356835#L2957-L2965 <https://github.com//travis-ci.org/myii/openssh-formula/jobs/585356835/issues/L2957-L2965>`_ `#166 <https://github.com/saltstack-formulas/openssh-formula/issues/166>`_

`0.42.0 <https://github.com/saltstack-formulas/openssh-formula/compare/v0.41.0...v0.42.0>`_ (2019-09-13)
------------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **semantic-release:** implement for this formula (\ `6300ddf <https://github.com/saltstack-formulas/openssh-formula/commit/6300ddf>`_\ ), closes `#165 <https://github.com/saltstack-formulas/openssh-formula/issues/165>`_
