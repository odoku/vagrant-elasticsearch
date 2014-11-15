# -*- coding: utf-8 -*-
from __future__ import unicode_literals, print_function

import random

import elasticutils


def create_test_data(index, doc_type, size):
    es = elasticutils.get_es()
    for x in range(0, size):
        body = {}
        for x in range(1, 11):
            body[x] = random.randrange(0, 100)

        es.index(
            index=index,
            doc_type=doc_type,
            body=body,
        )


if __name__ == '__main__':
    create_test_data('hoge', 'piyo', 100)
