#!/usr/bin/env python3
"""This module defines a fucntion"""


def insert_school(mongo_collection, **kwargs):
    """This fucntion will insert new documents"""
    mongo_collection.insert_one({**kwargs})
