# -*- coding: utf-8 -*-

from pathlib_mate import Path
from wow_sdm.exp03_wotlk.model import (
    SdmMacroTypeEnum,
    SdmMacro,
    SdmLua,
)

dir_here = Path.dir_here(__file__)

path_global_yml = dir_here / "parser" / "sample-global.yml"
path_character_yml = dir_here / "parser" / "sample-character.yml"
path_lua = dir_here / "SuperDuperMacro.lua"


class TestSDMMacro:
    def test_init(self):
        macro = SdmMacro(name="test")
        assert macro.character is None

    def test_parser(self):
        global_macro = SdmMacro.from_yaml(path_global_yml)
        assert global_macro.name == "interrupt"
        assert global_macro.character.name is None
        assert global_macro.id == 1
        assert global_macro.type == SdmMacroTypeEnum.button
        assert global_macro.icon == 1
        assert global_macro.text == (
            "#showtooltip\n" "/stopcasting\n" "/cast Counterspell"
        )
        assert global_macro.is_global() is True
        lua_code = global_macro.render()
        _ = lua_code
        # print(lua_code)

        character_macro = SdmMacro.from_yaml(path_character_yml)
        assert character_macro.name == "interrupt"
        assert character_macro.character.name == "Admin"
        assert character_macro.character.realm == "Azerothcore"
        assert character_macro.id == 2
        assert character_macro.type == SdmMacroTypeEnum.button
        assert character_macro.icon == 1
        assert character_macro.text == (
            "#showtooltip\n" "/stopcasting\n" "/cast Counterspell"
        )
        assert character_macro.is_global() is False
        lua_code = global_macro.render()
        _ = lua_code
        # print(lua_code)


class TestSDMLua:
    def test(self):
        sdm_lua = SdmLua(
            path_lua=path_lua,
            macros=[
                SdmMacro.from_yaml(path_global_yml),
                SdmMacro.from_yaml(path_character_yml),
            ],
        )
        lua_code = sdm_lua.render()
        _ = lua_code
        # print(lua_code)


if __name__ == "__main__":
    from wow_sdm.tests import run_cov_test

    run_cov_test(__file__, "wow_sdm.exp03_wotlk.model", preview=False)
