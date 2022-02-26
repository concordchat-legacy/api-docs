Guilds
======
Outlines what a hatsu Guild is, or for short, Represents a hatsu Guild.

.. warning::

    The Guild API is currently still in the design process,
    this means this is **subject to heavy change**.

Guild
-----

+---------------+---------------------------------------+
| name          | type                                  |
+---------------+---------------------------------------+
| id            | int                                   |
+---------------+---------------------------------------+
| name          | string                                |
+---------------+---------------------------------------+
| description   | string                                |
+---------------+---------------------------------------+
| banner        | string                                |
+---------------+---------------------------------------+
| invite_banner | string                                |
+---------------+---------------------------------------+
| vanity_url    | string                                |
+---------------+---------------------------------------+
| verified      | boolean                               |
+---------------+---------------------------------------+
| partnered     | boolean                               |
+---------------+---------------------------------------+
| official      | boolean (always ``false`` normally)   |
+---------------+---------------------------------------+
| owner         | int                                   |
+---------------+---------------------------------------+
| emojis        | List of Emoji Objects                 |
+---------------+---------------------------------------+
| roles         | List of Role Objects                  |
+---------------+---------------------------------------+

Role Object
-----------

+---------------+-----------------------------------------------+
| name          | type                                          |
+---------------+-----------------------------------------------+
| id            | int                                           |
+---------------+-----------------------------------------------+
| name          | string                                        |
+---------------+-----------------------------------------------+
| position      | int                                           |
+---------------+-----------------------------------------------+
| color         | string                                        |
+---------------+-----------------------------------------------+
| permissions   | list of strings which denote the permissions  |
+---------------+-----------------------------------------------+


Member Object
-------------

+------------+----------------------+
| name       | type                 |
+------------+----------------------+
| user       | User Object          |
+------------+----------------------+
| nick       | string               |
+------------+----------------------+
| avatar_url | string, null         |
+------------+----------------------+
| banner_url | string, null         |
+------------+----------------------+
| joined_at  | ISO8601 timestamp    |
+------------+----------------------+
| deaf       | boolean              |
+------------+----------------------+
| mute       | boolean              |
+------------+----------------------+
| owner      | boolean              |
+------------+----------------------+
| roles      | List of role id's    |
+------------+----------------------+

Routes
------

.. http:post:: /guilds

    **RateLimit-Limit:** 1, per minute.

    Create's a Guild

    +---------------+-----------+
    | name          | type      |
    +---------------+-----------+
    | name          | string    |
    +---------------+-----------+
    | description?  | string    |
    +---------------+-----------+

    Returns a Guild object, if sucessful.

    :reqheader Authorization: One of ``session_id``

    :statuscode 201: Success
    :statuscode 400: Invalid Data
    :statuscode 401: Unauthorized

.. http:get:: /guilds/guild-id

        **RateLimit-Limit:** 5, per second.

        Gets a Guild

        Returns a Guild object, if sucessful

        :reqheader Authorization: One of ``session_id``

        :statuscode 200: Success
        :statuscode 401: Unauthorized

.. http:get:: /guilds/guild-id/preview

        **RateLimit-Limit:** 1, per second.

        Returns a Partial Guild Object, of the Guild

        :statuscode 200: Success
        :statuscode 404: Not Found

.. http:post:: /invites/invite-code

        **RateLimit-Limit:** 5, per second.

        Joins a Guild

        Returns a Member Object, if sucessful

        :reqheader Authorization: One of ``session_id``

        :statuscode 200: Success
        :statuscode 401: Unauthorized

