Guilds
======

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

        Gets a Guild

        Returns a Guild object, if sucessful

        :reqheader Authorization: One of ``session_id``

        :statuscode 200: Success
        :statuscode 401: Unauthorized

.. http:patch:: /guilds/guild-id

        Edits the Guild

        Returns the Edited objects, if sucessful

        :reqheader Authorization: One of ``session_id``

        :statuscode 200: Success
        :statuscode 201: Not a Member, or incorrect session_id
        :statuscode 203: Not enough permissions
        :statuscode 404: Not Found

.. http:delete:: /guilds/guild-id

        Deletes a Guild

        :reqheader Authorization: One of ``session_id``

        :statuscode 201: Not a Member, or incorrect session_id
        :statuscode 203: Not enough permissions
        :statuscode 204: Success (No Content)
        :statuscode 404: Not Found

.. http:get:: /guilds/guild-id/preview

        Returns a Partial Guild Object, of the Guild

        :statuscode 200: Success
        :statuscode 404: Not Found

.. http:post:: /invites/invite-code

        Joins a Guild

        Returns a Member Object, if sucessful

        :reqheader Authorization: One of ``session_id``

        :statuscode 200: Success
        :statuscode 404: Not Found
        :statuscode 401: Unauthorized

