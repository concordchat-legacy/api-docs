Gateway
=======
The Gateway is hatsu's way of implementing a easy--affordable and non-blocking event system.

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
    from websockets import client

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

- ``PING_TIMEOUT``: 30 seconds.
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

Event Reference
---------------

- ``API_READY`` Called when the REST API starts a connection with the gateway.
- ``CHANNEL_CREATE`` Called when a channel is created
