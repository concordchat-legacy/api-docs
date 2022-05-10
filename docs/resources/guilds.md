# Guilds

Guilds represent a isolated collection of Users, Channels and Bots.

## Guild Object

### Guild Structure

| field             | type                  | description                               |
|-------------------|-----------------------|-------------------------------------------|
| id                | snowflake             | guild id                                  |
| name              | string                | A 40 or less letter guild name            |
| description       | string                | A 4000 or less letter guild description   |
| icon              | ?string               | The Guilds Icon Identifier                |
| banner            | ?string               | The Guilds Banner Identifier              |
| vanity_url        | ?string               | The Guilds Vanity URL                     |
| owner_id          | snowflake             | The ID of the Guild Owner                 |
| nsfw              | boolean               | If the Guild is a NSFW Guild or not       |
| large             | boolean               | The Guild has 60000 or more members       |
| perferred_locale  | string                | The Guilds' Owner Locale                  |
| permissions       | string                | The Guilds Default Permissions            |
| splash            | string                | The Guilds Splash Screen Identifier       |
| features          | list                  | A list of the Guilds' Beta Features       |
| verified          | boolean               | If the server is verified                 |
| members \*        | list of members       | List of Member Objects                    |
| channels \*       | list of channels      | List of Channel Objects                   |

\* These Fields are only sent on `GUILD_CREATE` / `POST /guilds`.

> note
> Due to multiple API deprecations, please be prepared to handle both ``en_US`` and ``en-US``.

#### Example Guild

```json
{
    "id": "8590863943958528",
    "name": "Genshin Impact",
    "description": "Unofficial Concord for Genshin Impact",
    "vanity_url": "genshinimpact",
    "icon": "",
    "banner": "",
    "owner_id": "2124005656035328",
    "nsfw": false,
    "large": false,
    "perferred_locale": "en_US",
    "permissions": "33938497",
    "splash": "",
    "features": [],
    "verified": false
}
```

### Guild Invite Structure

| field             | type      | description                                   |
|-------------------|-----------|-----------------------------------------------|
| id                | string    | The underlying invite code                    |
| guild_id          | snowflake | The Guild ID which created this invite        |
| creator_id        | snowflake | The User who created this invite              |
| created_at        | timestamp | When this invite was created                  |
| max_invited       | integer   | The max inviteable Members                    |
| amount_invited    | integer   | The amount of people invited from this invite |

> warn
> Vanity Guild Invites Cannot be Deleted

> note
> Invites expire by being deleted, therefore their information will be fed to the Garbage Collector.

#### Example Guild Invite

```json
{
    "id": "genshinimpact",
    "creator_id": 0,
    "created_at": "2022-05-01T02:55:04.706000",
    "max_invited": null,
    "amount_invited": null
}
```

> note
> The `creator_id` is 0 when the invite is vanity.

### Guild Member Structure

| field     | type                      | description                                       |
|-----------|---------------------------|---------------------------------------------------|
| id        | snowflake                 | The User ID of this Member                        |
| guild_id  | snowflake                 | The Members Guild ID                              |
| avatar    | ?string                   | The Users Guild Avatar                            |
| user      | User                      | The underlying user                               |
| banner    | ?string                   | The Users Guild Banner                            |
| joined_at | timestamp                 | When the User joined this Guild                   |
| roles     | list                      | A list of Role Snowflakes which the User has      |
| nick      | ?string                   | The Users' Nickname                               |
| owner     | boolean                   | If the Member is the owner of this Guild          |

#### Example Guild Member

```json
{
    "id": "2124005656035328",
    "avatar": "",
    "banner": "",
    "joined_at": "2022-05-01T02:51:33.180000",
    "roles": [],
    "nick": "",
    "owner": true,
    "user": {
        "id": "2124005656035328",
        "username": "VincentRPS",
        "discriminator": 6538,
        "flags": 295,
        "avatar": "",
        "banner": "",
        "locale": "en-US",
        "joined_at": "2022-05-01T02:44:31.386000",
        "bio": "None",
        "verified": true,
        "system": true,
        "bot": false,
        "referrer": "",
        "pronouns": "he/him"
    }
}
```


## Create Guild % POST /guilds

Creates a Guild, Returns a [Guild](#RESOURCES_GUILD/guild-structure) object, if successful and gives a `GUILD_CREATE` event.

> warn
> Bots in 20 or more Guilds cannot create a Guild.

###### JSON Params

| Field       | Type     | Description           |
|-------------|----------|-----------------------|
| name        | string   | Guild Name            |
| description | string?  | Guild Description     |
| nsfw        | boolean? | If the Guild is NSFW  |
| icon        | datauri? | The Guilds Icon       |



## Edit Guild % PATCH /guilds/{guild.id#RESOURCES_GUILD/guild-structure}

Returns the edited [Guild](#RESOURCES_GUILD/guild-structure) object, if successful. Gives a `GUILD_EDIT` event.

Requires the `MANAGE_GUILD` permission.

Accepts the same fields as `POST /guilds`.


## Delete Guild % DELETE /guilds/{guild.id#RESOURCES_GUILD/guild-structure}

Deletes the Guild if successful. Only owners can delete Guilds.

> warn
> "large" Guilds cannot be deleted.

## Get Guild % GET /guilds/{guild.id#RESOURCES_GUILD/guild-structure}

Returns the [Guild](#RESOURCES_GUILD/guild-structure) of this Guild, if you are a member.
