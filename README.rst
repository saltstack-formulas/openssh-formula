openssh
=======
Install and configure an openssh server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``openssh``
-----------

Installs the ``openssh`` package and service.

``openssh.config``
------------------

Installs the configuration file included in this formula
(under "openssh/files").

``openssh.banner``
------------------

Installs a banner that users see when SSH-ing in.
