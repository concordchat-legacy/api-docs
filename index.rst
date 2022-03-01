Welcome
=======
Welcome to the official, one--and--only api documentation for hatsu.

.. note::

   hatsu is built upon http/2,
   trying to use http/1.1 or 1 will lead to a forbidden.

Connecting
----------
When connecting you will want to use the following link for the REST API:

.. code-block::

   https://hatsu.vincentrps.xyz

When connecting to the Gateway you will want to use the following link:

.. code-block::

   wss://gateway.vincentrps.xyz

User Agents
-----------
As-Of current, hatsu does **not** track the ``User-Agent`` header,
but it is still recommended you put it there.

Format: ``Library Name (https://github.com/user/library) language: version http-client: version``

.. note::

   The ``http-client`` is optional.

Example: ``hatsu.py (https://github.com/hatsupy/hatsu.py) python: 3.10``

Index
-----

.. toctree::
   :maxdepth: 2

   users
   guilds
   channels
   gateway
