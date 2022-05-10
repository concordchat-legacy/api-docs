# Users

Unlike a Bot, Users can spawn all around the platform, be members of guilds, chat in channels and much more.
Bots normally are banned on endpoints, such as analytical endpoints or private ones.

## User Object

### User Structure

| field         | type                                          | description                           |
|---------------|-----------------------------------------------|---------------------------------------|
| id            | snowflake                                     | The Users Unique Identifier           |
| username      | string                                        | The Users Username                    |
| discriminator | integer                                       | The Users 4 Digit Filter Identifier   |
| email         | string                                        | The Users Email                       |
| flags         | integer                                       | The Users Flags                       |
| avatar        | ?string                                       | The Users Avatar                      |
| banner        | ?banner                                       | The Users Banner                      |
| locale        | string                                        | The Users Locale                      |
| joined_at     | timestamp                                     | When the User was Created             |
| bio           | ?string                                       | The Users Bio/About Me                |
| referrer      | ?string                                       | The Users Referrer                    |


#### Example User

```json
{
    "id": "2124005656035328",
    "username": "VincentRPS",
    "discriminator": 6538,
    "email": "vincent@concord.chat",
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
```


## Get Me % GET users/@me

Returns the current Users [object](#RESOURCES_USERS/user-structure), if successful.

## Get User % GET /users/{user.id#RESOURCES_USER/user-structure}

Returns the Users [object](#RESOURCES_USERS/user-structure), if successful.
