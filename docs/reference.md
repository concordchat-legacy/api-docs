Welcome
-------
Welcome to the Concord Documentation, This Documents Some of the Concord Standard APIs included with NitroDB

BaseURL
~~~~~~~
The Official hosted REST API is hosted on the following URL:

.. code-block:: txt

    https://concord.chat/api

API Versioning
~~~~~~~~~~~~~~

The API is versioned to prevent breaking changes for old code,
at the end of the baseurl you will have to add something like ``/v{api_version}``.

+--------+--------------+---------+
| Number | Status       | Default |
+--------+--------------+---------+
| v5     | Available    | ✓       |
+--------+--------------+---------+
| v4     | Discontinued | ❌      |
+--------+--------------+---------+

Snowflakes
~~~~~~~~~~
Concord uses the Twitter Snowflake Algorithm to generate most of its IDs, 
these are unique, identifiable and sleek IDs, they look like the this ``7294043503133174``
and contain the following:

+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+
| field      | bits      | number of bits | description                                                                                                       | retrieval                             |
+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+
| Timestamp  | 63 to 22  | 42 bits        | Milliseconds since the Concord Epoch, exactly ``Thursday, April 7, 2022 9:54:31.415 AM`` UTC or ``1649325271415`` | ``(snowflake >> 22) + 1649325271415`` |
+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+
| Worker ID  | 21 to 17  | 5 bits         |                                                                                                                   | ``(snowflake & 0x3E0000) >> 17``      |
+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+
| Process ID | 16 to 12  | 5 bits         |                                                                                                                   | ``(snowflake & 0x1F000) >> 12``       |
+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+
| Increment  | 11 to 0   | 12 bits        | For every ID that is generated on that process, this number is incremented                                        | ``snowflake & 0xFFF``                 |
+------------+-----------+----------------+-------------------------------------------------------------------------------------------------------------------+---------------------------------------+

Snowflakes are **always** given as a integer by the API but doesn't need to be the same with the client.

Supported Locales
~~~~~~~~~~~~~~~~~

.. note:: Locales are only never used inside the API itself.

+-----------+-----------------------+
| Locale    | Country               |
+-----------+-----------------------+
| en-US     | English US            |
+-----------+-----------------------+
| en-GB     | English Great Britan  |
+-----------+-----------------------+
