openssh
=======
Install and configure an openssh server.

States
------
``openssh``
    Installs the ``openssh`` package and service.
``openssh.config``
    Installs the configuration file included in this formula (under "openssh/files").
``openssh.banner``
    Installs a banner that users see when SSH-ing in.
