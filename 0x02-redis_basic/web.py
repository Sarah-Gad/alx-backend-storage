#!/usr/bin/env python3
'''A module with tools for request caching and tracking.
'''
import redis
import requests
from functools import wraps
from typing import Callable


redis_store = redis.Redis()
'''The module-level Redis instance.
'''


def get_page(url: str) -> str:
    '''Returns the content of a URL after caching the request's response,
    and tracking the request.
    '''
    redis_store.incr(f'count:{url}')
    result = redis_store.get(f'result:{url}')
    if result:
        return result.decode('utf-8')
    response = requests.get(url)
    result = response.text
    redis_store.set(f'result:{url}', result, ex=10)
    return result
