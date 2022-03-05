Gateway
=======
The Gateway is hatsu's way of implementing a easy--affordable and non-blocking event system.

Gaining the Port
----------------
The Gateway uses ports to separate connections and keep ram efficient,
at highest ports can only have 4000 users on them.

Example of getting a port:

.. code-block:: python3

    import requests

    r = requests.get('https://gateway.vincentrps.xyz/port')
    print(r.json())

Identifying
-----------
Once you have done the initial connection with the gateway 
you will want to send your identification payload.

+------------+--------+-----------+
| name       | type   | optional? |
+------------+--------+-----------+
| session_id | string | No        |
+------------+--------+-----------+
| encoding   | string | Yes       |
+------------+--------+-----------+

The encoding should be one of:

- ``json``
- ``zlib``

It is recommended to use the ``json`` encoding, 
as it doesn't require decompressing and is more tested because of it's ease-of-use.

This is a code example of a gateway connection:

.. code-block:: python3

    import json
    import asyncio
    import requests
    from websockets import client

    r = requests.get('https://gateway.vincentrps.xyz/port')
    d = r.json()

    async def connection():
        ws = await client.connect('wss://gateway.vincentrps.xyz', ping_timeout=30)
        await ws.send(json.dumps({'session_id': 'my_session_id'}))
        while True:
            recv = await ws.recv()
            print(recv)
    
    asyncio.run(connection())

Keeping Alive
-------------
The only thing you need to do to keep the connection alive, 
is to ping the gateway before the timeout runs out.

- ``PING_TIMEOUT``: 20 seconds.
- ``PING_INTERVAL``: 20 seconds.

.. note::
    
    Most WebSocket Wrappers should already do this automatically.

Event Payload
-------------

A event payload goes as so:

.. code-block:: json

    {
    "t": "EVENT_NAME",
    "d": {
        "key": "VaLuE12345"
        }
    }

**PRESENCE_UPDATE** Payload:

.. code-block:: json
    
    {
    "t": "PRESENCE_UPDATE",
    "id": 123456,
    "d": {
        "type": 1/2/3/4,
        "description": "string",
        "emoji": emoji_id,
        "embed": {
            "name": "string",
            "description": "string",
            "banner_url": "string",
            "text": {
                "top": "string",
                "bottom": "string",
                }
            }
        }
    }

**NOTIFICATION** Payload:

.. code-block:: json

    {
    "t": "NOTIFICATION",
    "type": "MESSAGE, GUILD, EVERYONE, HERE",
    "excerpt": {
            ...
        }
    }

Event Reference
---------------

- ``GUILD_CREATE`` Called when you create a Guild.

- ``GUILD_JOIN`` Called when you join a Guild.

- ``GUILD_INIT`` Called after you get the `READY` event. 
Given one time for each guild, 
The new ``channels`` field will be added to the guild object.

- ``GUILD_UPDATE`` Called when a Guild is updated.

- ``GUILD_DELETE`` Called when a Guild is deleted.

- ``INVITE_CREATE`` Called when a user creates an invite.

- ``CHANNEL_CREATE`` Called when a channel is created.

- ``PRESENCE_UPDATE`` Called when a user updates there presence.

- ``NOTIFICATION`` Called when you get a notification
