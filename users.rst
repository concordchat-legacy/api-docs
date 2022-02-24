Users
=====
This covers the current user-api of hatsu.

A ``session_id`` is, in lamens terms, just a stringized snowflake.

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

    **RateLimit-Limit:** 1, per hour

    Creates a User

    **Arguments:**

    +-----------+---------+
    | name      | type    |
    +-----------+---------+
    | username  | string  |
    +-----------+---------+
    | separator | integer |
    +-----------+---------+
    | email     | string  |
    +-----------+---------+
    | password  | string  |
    +-----------+---------+

    :statuscode 201: Success
    :statuscode 400: Invalid Data

.. http:patch:: /users/@me

    **RateLimit-Limit:** 2, per second

    Edits a User

    +-----------+---------+
    | name      | type    |
    +-----------+---------+
    | username  | string  |
    +-----------+---------+
    | separator | integer |
    +-----------+---------+
    | email     | string  |
    +-----------+---------+
    | password  | string  |
    +-----------+---------+

    :statuscode 200: Success
    :statuscode 400: Invalid Data
    :statuscode 401: Unauthorized

.. http:get:: /users/@me

    **RateLimit-Limit:** 5, per second

    Gives a user object of your currently identified account.

    :reqheader Authorization: One of ``session_id``

    :statuscode 200: Success
    :statuscode 401: Unauthorized
