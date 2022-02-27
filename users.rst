Users
=====
This covers the current user-api of hatsu.

A ``session_id`` is, in lamens terms, just a stringized snowflake.

.. note::

    Session ID's will only be seeable once you connect to the Gateway,
    the ``READY`` events `d` payload witholds your user data, 
    of which includes the ``session_ids`` object. 

User
----
The following Represents a hatsu user.

+----------------+-----------------+
| name           | type            |
+----------------+-----------------+
| id             | integer         |
+----------------+-----------------+
| username       | string          |
+----------------+-----------------+
| separator      | integer         |
+----------------+-----------------+
| bio            | string          |
+----------------+-----------------+
| avatar_url     | string          |
+----------------+-----------------+
| banner_url     | string          |
+----------------+-----------------+
| flags          | list of strings |
+----------------+-----------------+
| verified       | boolean         |
+----------------+-----------------+
| email          | string          |
+----------------+-----------------+
| password       | string(hashed)  |
+----------------+-----------------+
| system         | boolean         |
+----------------+-----------------+
| email_verified | boolean         |
+----------------+-----------------+
| session_ids    | list strings    |
+----------------+-----------------+


users/@me
---------

.. http:post:: /users/@me

    Creates a User

    **Arguments:**

    +-----------+---------+
    | name      | type    |
    +-----------+---------+
    | username  | string  |
    +-----------+---------+
    | separator | integer |
    +-----------+---------+
    | bio?      | string  |
    +-----------+---------+
    | email     | string  |
    +-----------+---------+
    | password  | string  |
    +-----------+---------+

    :statuscode 201: Success
    :statuscode 400: Invalid Data

.. http:patch:: /users/@me

    Edits a User

    +------------+---------+
    | name       | type    |
    +------------+---------+
    | username   | string  |
    +------------+---------+
    | separator  | integer |
    +------------+---------+
    | bio?       | string  |
    +------------+---------+
    | email?     | string  |
    +------------+---------+
    | password?  | string  |
    +------------+---------+

    :statuscode 200: Success
    :statuscode 400: Invalid Data
    :statuscode 401: Unauthorized

.. http:get:: /users/@me

    Gives a user object of your currently identified account.

    :reqheader Authorization: One of ``session_id``

    :statuscode 200: Success
    :statuscode 401: Unauthorized
