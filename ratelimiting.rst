RateLimiting
============
Ayaka implements ratelimits in a straight forward--and easy matter.

.. note::

    The current ratelimit implementation on the backend 
    is still a bit iffy and is due to change.

.. code-block::

    X-RateLimit-Bucket: 'LIMITER/ip_address/ROUTE_NAME/limit/time/per'
    X-RateLimit-Limit: '10'
    X-RateLimit-Remaining: '3'
    X-RateLimit-Reset: '1645970050'
    X-RateLimit-Retry-After: '0'
