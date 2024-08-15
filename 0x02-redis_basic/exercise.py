#!/usr/bin/env python3
"""This module creates a redic instance"""
import redis
import uuid
from typing import Union
from typing import Callable, Optional



class Cache:
    def __init__(self) -> None:
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        r_key = str(uuid.uuid4())
        self._redis.set(r_key, data)
        return r_key

    def get(self, key: str, fn: Optional[Callable] = None):
        val = self._redis.get(key)
        if (val == None):
            return None
        if (fn == None):
            return val
        return fn(val)

    def get_str(self, bstr):
        return bstr.decode('utf-8')

    def get_int(self, bint):
        return int.from_bytes(bint, byteorder='little')
