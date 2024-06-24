# -*- coding: utf-8 -*-

from wow_sdm.api import exp03_wotlk
from wow_sdm.logger import logger


def test():
    from wow_sdm.tests.exp03_wotlk.acc_dataset import dir_here, ds

    path = dir_here.joinpath("acc_enum.py")
    content = ds.to_module(
        import_line="from wow_sdm.tests.exp03_wotlk.acc_dataset import ds",
    )
    path.write_text(content)

    content = exp03_wotlk.to_module(
        dir_root=dir_here.joinpath("sdm_macros"),
        import_dir_root_line="from wow_sdm.tests.exp03_wotlk.sdm_dataset import dir_root",
    )
    dir_here.joinpath("sdm_enum.py").write_text(content, encoding="utf-8")

    from wow_sdm.tests.exp03_wotlk.sdm_mapping import sdm_mapping

    sdm_mapping.client.dir_wtf.remove_if_exists()
    real_run = True

    with logger.disabled(
        disable=True,  # DON't show log
        # disable=False, # show log
    ):
        sdm_mapping.apply(real_run)


if __name__ == "__main__":
    from wow_sdm.tests import run_cov_test

    run_cov_test(__file__, "wow_sdm.exp03_wotlk", preview=False)
