#!/usr/bin/env python3
"""This module defines a fucntion"""


def update_topics(mongo_collection, name, topics):
    """This fucntion changes all topics of a school"""
    mongo_collection.update_one(
            {'name': name},
            {'$set': {'topics': topics}}
            )
