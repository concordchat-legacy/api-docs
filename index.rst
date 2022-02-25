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

   https://hatsu.vincentrps.xyz/v(api-version)

When connecting to the Gateway you will want to use the following link:

.. code-block::

   wss://gateway.vincentrps.xyz

**API Versions:**

+---------+-------------+-----------+
| version | status      | recommend |
+---------+-------------+-----------+
| v1      | available   | default   |
+---------+-------------+-----------+

Index
-----

.. toctree::
   :maxdepth: 2

   users
   guilds
   gateway
