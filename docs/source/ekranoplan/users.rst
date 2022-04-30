Users
-----

Concord normally gives users its full route set, unlike bots most if not all endpoints are accessible by users, they are Concords base entity.

.. _User Object:

User Object
~~~~~~~~~~~

+---------------+-----------------------------------------------+---------------------------------------+
| field         | type                                          | description                           |
+---------------+-----------------------------------------------+---------------------------------------+
| id            | snowflake                                     | The Users Unique Identifier           |
+---------------+-----------------------------------------------+---------------------------------------+
| username      | string                                        | The Users Username                    |
+---------------+-----------------------------------------------+---------------------------------------+
| discriminator | integer                                       | The Users 4 Digit Filter Identifier   |
+---------------+-----------------------------------------------+---------------------------------------+
| email         | string                                        | The Users Email                       |
+---------------+-----------------------------------------------+---------------------------------------+
| password      | !string                                       | The Users Hashed Password             |
+---------------+-----------------------------------------------+---------------------------------------+
| flags         | integer                                       | The Users Flags                       |
+---------------+-----------------------------------------------+---------------------------------------+
| avatar        | ?string                                       | The Users Avatar                      |
+---------------+-----------------------------------------------+---------------------------------------+
| banner        | ?banner                                       | The Users Banner                      |
+---------------+-----------------------------------------------+---------------------------------------+
| locale        | string                                        | The Users Locale                      |
+---------------+-----------------------------------------------+---------------------------------------+
| joined_at     | timestamp                                     | When the User was Created             |
+---------------+-----------------------------------------------+---------------------------------------+
| bio           | ?string                                       | The Users Bio/About Me                |
+---------------+-----------------------------------------------+---------------------------------------+
| referrer      | ?string                                       | The Users Referrer                    |
+---------------+-----------------------------------------------+---------------------------------------+


.. _users_me:

.. http:get:: /users/@me

    :synopsis: Returns the Current :ref:`User<User Object>`.

    :reqheader Authorization: A User Token

    :statuscode 200: Success

.. _get_user:

.. http:get:: /users/:id

    :synopsis: Returns a :ref:`User<User Object>` object.

    :reqheader Authorization: A User Token

    :statuscode 200: Success
    :statuscode 404: User Not Found

.. _create_user:

.. http:post:: /users

    :synopsis: Returns a :ref:`User<User Object>` object.

    Includes a ``token`` inside the returned object to be used for authorization.

    Example:

    .. code-block:: json

        {
            "username": "VincentRPS",
            "email": "me@example.com",
            "password": "Super Safe Password",

            // Optional
            "bio": "Super Cool Bio",
            "locale": "en_US"
        }

    :query string utm_source: A Optional Referrer

    :statuscode 200: Success
    :statuscode 400: Invalid Data
