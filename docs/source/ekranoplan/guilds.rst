Guilds
------

Concord Names its Communitys "guilds," Guilds don't have a fixed member limit inside the standard, 
but it is recommended you add it to your implementation.

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

Example:

.. code-block:: json

    {
        "id": "7272442631815168",
        "owner_id": "7272479179997184",
        "name": "Genshin Impact Fan Club",
        "description": "Fan Club for Genshin Impact!",
        "icon": "",
        "banner": "",
        "vanity_url": "genshinfanclub",
        "nsfw": false,
        "large": false,
        "perferred_locale": "EN_US",
        "permissions": "0",
        "splash": "",
        "features": []
    }

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
        "guild_id": "7272442631815168",
        "creator_id": "7272479179997184",
        "created_at": "2022-04-27T11:33:26.503471+00:00"
    }

Member Object
~~~~~~~~~~~~~

+-----------+---------------+---------------------------------------------------+
| field     | type          | description                                       |
+-----------+---------------+---------------------------------------------------+
| id        | snowflake     | The User ID of this Member                        |
+-----------+---------------+---------------------------------------------------+
| guild_id  | snowflake     | The Members Guild ID                              |
+-----------+---------------+---------------------------------------------------+
| user      | User Object   | The underlying User of this Member                |
+-----------+---------------+---------------------------------------------------+
| avatar    | ?string       | The Users Guild Avatar                            |
+-----------+---------------+---------------------------------------------------+
| banner    | ?string       | The Users Guild Banner                            |
+-----------+---------------+---------------------------------------------------+
| joined_at | timestamp     | When the User joined this Guild                   |
+-----------+---------------+---------------------------------------------------+
| roles     | list          | A list of Role Snowflakes which the User has      |
+-----------+---------------+---------------------------------------------------+
| nick      | ?string       | The Users' Nickname                               |
+-----------+---------------+---------------------------------------------------+
| owner     | boolean       | If the Member is the owner of this Guild          |
+-----------+---------------+---------------------------------------------------+

Example:

.. code-block:: json

    {
        "id": "7272479179997184",
        "guild_id": "7272442631815168",
        "user": {},
        "avatar": "",
        "banner": "",
        "joined_at": "2022-04-27T11:33:26.503471+00:00",
        "roles": [],
        "nick": "",
        "owner": true
    }

.. TODO:: Document Routes
