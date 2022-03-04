Welcome
=======
Welcome to the official, one--and--only api documentation for hatsu.

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

Example: ``hatsu.py (https://github.com/hatsupy/hatsu.py) python: 3.10 aiohttp: 3.8.1``

Snowflakes
----------
hatsu uses snowflakes as it's one-time id unique generation platform, these are based off the twitter snowflake.

A hatsu snowflake normally are made with:

- The Epoch: ``1577836801``, The first second of 2020.
- Worker ID: Generated from the Current Thread Process.
- Datacenter ID: 0, We are working on making this more unique.
- TimeStamp: The Current Epoch.
- Sequence: The Current Sequence + 1.

and thats it.  This could be seen as too much but it helps make id's which are small and unique.

Index
-----

.. toctree::
   :maxdepth: 2

   users
   guilds
   channels
   gateway
   ratelimiting
