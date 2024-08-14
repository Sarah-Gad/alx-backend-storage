#!/usr/bin/env python3
"""This module defines a fucntion"""


def list_all(mongo_collection):
    """This fucntion will list all documents"""
    return list(mongo_collection.find())
