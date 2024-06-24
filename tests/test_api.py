# -*- coding: utf-8 -*-

from wow_sdm import api


def test():
    _ = api


if __name__ == "__main__":
    from wow_sdm.tests import run_cov_test

    run_cov_test(__file__, "wow_sdm.api", preview=False)
