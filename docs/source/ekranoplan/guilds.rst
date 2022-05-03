Guilds
------

Redux Names its Communitys "guilds," Guilds don't have a fixed member limit inside the standard, 
but it is recommended you add it to your implementation.

.. _Guild Object:

Guild Object
~~~~~~~~~~~~

+-------------------+-----------+-------------------------------------------+
| field             | type      | description                               |
+-------------------+-----------+-------------------------------------------+
| id                | snowflake | guild id                                  |
+-------------------+-----------+-------------------------------------------+
| name              | string    | A 40 or less letter guild name            |
+-------------------+-----------+-------------------------------------------+
| description       | string    | A 4000 or less letter guild description   |
+-------------------+-----------+-------------------------------------------+
| icon              | ?string   | The Guilds Icon Identifier                |
+-------------------+-----------+-------------------------------------------+
| banner            | ?string   | The Guilds Banner Identifier              |
+-------------------+-----------+-------------------------------------------+
| vanity_url        | ?string   | The Guilds Vanity URL                     |
+-------------------+-----------+-------------------------------------------+
| owner_id          | snowflake | The ID of the Guild Owner                 |
+-------------------+-----------+-------------------------------------------+
| nsfw              | boolean   | If the Guild is a NSFW Guild or not       |
+-------------------+-----------+-------------------------------------------+
| large             | boolean   | The Guild has 60000 or more members       |
+-------------------+-----------+-------------------------------------------+
| perferred_locale  | string    | The Guilds' Owner Locale                  |
+-------------------+-----------+-------------------------------------------+
| permissions       | string    | The Guilds Default Permissions            |
+-------------------+-----------+-------------------------------------------+
| splash            | string    | The Guilds Splash Screen Identifier       |
+-------------------+-----------+-------------------------------------------+
| features          | list      | A list of the Guilds' Beta Features       |
+-------------------+-----------+-------------------------------------------+
| verified          | boolean   | If the server is verified                 |
+-------------------+-----------+-------------------------------------------+

.. NOTE:: Due to multiple API deprecations, please be prepared to handle both ``EN_US`` and ``en_US``.

Example:

.. code-block:: json

    {
        "id": "8272616840232960",
        "name": "Genshin Impact",
        "description": "",
        "vanity_url": "genshinimpact",
        "icon": "",
        "banner": "",
        "owner_id": "6427339792089088",
        "nsfw": false,
        "large": false,
        "perferred_locale": "en_US",
        "permissions": "33938497",
        "splash": "",
        "features": [],
        "verified": false
    }

.. _Guild Invite Object:

Guild Invite Object
~~~~~~~~~~~~~~~~~~~

+---------------+-----------+-------------------------------------------+
| field         | type      | description                               |
+---------------+-----------+-------------------------------------------+
| id            | string    | The underlying invite code                |
+---------------+-----------+-------------------------------------------+
| guild_id      | snowflake | The Guild ID which created this invite    |
+---------------+-----------+-------------------------------------------+
| creator_id    | snowflake | The User who created this invite          |
+---------------+-----------+-------------------------------------------+
| created_at    | timestamp | When this invite was created              |
+---------------+-----------+-------------------------------------------+

Example:

.. code-block:: json

    {
        "id": "GkD9H5Y",
        "guild_id": "8272616840232960",
        "creator_id": "6427339792089088",
        "created_at": "2022-04-27T11:33:26.503471+00:00"
    }

.. _Guild Member Object:

Member Object
~~~~~~~~~~~~~

+-----------+---------------------------+---------------------------------------------------+
| field     | type                      | description                                       |
+-----------+---------------------------+---------------------------------------------------+
| id        | snowflake                 | The User ID of this Member                        |
+-----------+---------------------------+---------------------------------------------------+
| guild_id  | snowflake                 | The Members Guild ID                              |
+-----------+---------------------------+---------------------------------------------------+
| avatar    | ?string                   | The Users Guild Avatar                            |
+-----------+---------------------------+---------------------------------------------------+
| banner    | ?string                   | The Users Guild Banner                            |
+-----------+---------------------------+---------------------------------------------------+
| joined_at | timestamp                 | When the User joined this Guild                   |
+-----------+---------------------------+---------------------------------------------------+
| roles     | list                      | A list of Role Snowflakes which the User has      |
+-----------+---------------------------+---------------------------------------------------+
| nick      | ?string                   | The Users' Nickname                               |
+-----------+---------------------------+---------------------------------------------------+
| owner     | boolean                   | If the Member is the owner of this Guild          |
+-----------+---------------------------+---------------------------------------------------+

Example:

.. code-block:: json

    {
        "id": "6427339792089088",
        "guild_id": "8272616840232960",
        "avatar": "",
        "banner": "",
        "joined_at": "2022-04-27T11:33:26.503471+00:00",
        "roles": [],
        "nick": "",
        "owner": true
    }

.. _create_guild:

.. http:post:: /guilds

    :synopsis: Returns a :ref:`Guild <Guild Object>` object.

    Example:

    .. code-block:: json

        {
            "name": "Genshin Impact",

            // Optional
            "description": "A Genshin Impact Redux",
            "nsfw": false
        }

    Response:

    .. code-block:: json

        {
            "id": "6427339792089088",
            "owner_id": "8272616840232960",
            "name": "Genshin Impact",
            "description": "A Genshin Impact Redux",
            "icon": "",
            "banner": "",
            "vanity_url": "",
            "nsfw": false,
            "large": false,
            "perferred_locale": "en_US",
            "permissions": "0",
            "splash": "",
            "features": [],
            "members": [
                {
                    "id": "6427339792089088",
                    "guild_id": "8272616840232960",
                    "avatar": "",
                    "banner": "",
                    "joined_at": "2022-04-27T11:33:26.503471+00:00",
                    "roles": [],
                    "nick": "",
                    "owner": true
                }
            ],
            "channels": [
                {
                    "id": "7513087221205917",
                    "guild_id": "7272442631815168",
                    "name": "Text Channels",
                    "parent_id": 0,
                    "position": 0,
                    "type": 1,
                    "permission_overwrites": [],
                    "topic": "",
                    "slowmode_timeout": 0
                },
                {
                    "id": "7513514956130329",
                    "guild_id": "7272442631815168",
                    "name": "general",
                    "parent_id": "7513087221205917",
                    "position": 1,
                    "type": 1,
                    "permission_overwrites": [],
                    "topic": "",
                    "slowmode_timeout": 0
                }
            ],
        }

    :reqheader Authorization: User Token

    :statuscode 201: Success
    :statuscode 400: Bad Data

.. _edit_guild:

.. http:patch:: /guilds/:id

    :synopsis: Returns the edited :ref:`Guild<Guild Object>` object.

    Requires One of:
        - Guild Owner
        - Manage Guild
        - Adminstrator

    Example:

    .. code-block:: json

        {
            "name": "Genshin Fan Club",
            "description": "The best Genshin Fan Club on Redux!",
            "nsfw": false
        }

    :reqheader Authorization: User Token

    :statuscode 200: Success
    :statuscode 401: Forbidden

.. _delete_guild:

.. http:delete:: /guilds/:id

    :synopsis: Deletes the Guild if the requester is the owner and the Guild is not specified as "large."

    :statuscode 203: Success
    :statuscode 401: Forbidden 

.. _get_guild:

.. http:get:: /guilds/:id

    :synopsis: Returns the :ref:`object<Guild Object>` of this Guild, if you are a member.

    :statuscode 200: Success
    :statuscode 401: Forbidden

.. _claim_vanity:

.. http:put:: /guilds/:id/vanity

    :synopsis: Claim the Guilds Vanity, Returns a new :ref:`Guild<Guild Object>` object.

    Please make sure the Vanity isn't taken before requesting.

    Requires One of:
        - Guild Owner
        - Adminstrator

    :query string utm_vanity: The Vanity Code

    :statuscode 201: Success
    :statuscode 401: Forbidden
