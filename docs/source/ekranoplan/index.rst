Ekranoplan
----------

Ekranoplan, named after the "Caspian Sea Monster" or "Lun-class Ekranoplan," 
is the Core Backend REST API for Concord.

Its been built for high scalablility, large flexibility, and low ping. 
The Official Implementation is written in python and is an example 
for any other implementation to follow.

Breaking Changes and Usage with other tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We recommend when upgrading Ekranoplan to make sure you have the right versions of its other tooling to not break the API,
We can and will most probably make breaking changes in minor versions.

Ratelimits
~~~~~~~~~~

Currently, the official implementation does not house any ratelimiting, as we are instead using NGINX and Cloudflare.

But if you are intereasted in making one for your implementation, or possibly helping us with making one here is the current ruleset:

- The Limits are only as-followed

    please remember this only covers a fixed-window style limit.

    - Channel Routes
        10/second per channel
    - Message Routes
        70/second per channel
    - Other Routes
        50/second

.. toctree::
    :maxdepth: 2
    :hidden:
    
    guilds

.. panel-box::
  :title: Overview
  :id: "ekranoplan"
  :class: my-panel

  * :doc:`Guilds <guilds>` - Guild Documentation.
