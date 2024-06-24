# -*- coding: utf-8 -*-

"""
这个模块可以生成一个对所有的 SdmMacro YAML 文件进行枚举的 Python 模块.
"""

from pathlib_mate import Path


def slugify(s: str) -> str:
    """
    将字符串转换成一个合法的 Python 变量名.
    """
    return s.replace(" ", "_").replace("-", "_").replace("/", "__").replace("\\", "__")


def get_var_name(
    dir: Path,
    path: Path,
):
    """
    从文件路径生成一个合法的 Python 变量名作为 Enum 枚举值的变量名. ``path`` 是这个 yaml 文件
    的路径, 而 ``dir`` 则是我们在搜索 yaml 文件时的起始点根目录.
    例如我们有一个 ``${HOME}/sdm_macros/warrior/main_rotation.yml`` 文件, 而 ``dir`` 是
    ``${HOME}/sdm_macros/``. 那么这个模板文件的变量名就会是 ``warrior__main_rotation``.

    :param dir:
    :param path:
    """
    relpath = path.relative_to(dir)
    var_name = slugify(str(relpath)).split(".")[0]
    if var_name[0].isalpha() is False:  # 如果第一个字符不是字母, 那么加上一个 f_ (file)
        var_name = "f_" + var_name
    return var_name


def to_module(
    dir_root: Path,
    import_dir_root_line: str,
):
    lines = [
        "# -*- coding: utf-8 -*-",
        "",
        import_dir_root_line,
        "",
        "# fmt: off",
        "class MacroEnum:",
    ]
    tab = " " * 4
    paths = list(Path.sort_by_abspath(dir_root.select_by_ext(".yml")))
    if len(paths):
        for path in paths:
            var_name = get_var_name(dir_root, path)
            relpath = path.relative_to(dir_root)
            joinpath_arg = ", ".join([f'"{part}"' for part in relpath.parts])
            lines.append(
                f"{tab}{var_name} = dir_root.joinpath({joinpath_arg}) # file://{path}"
            )
    else:  # pragma: no cover
        lines.append("    pass")
    lines.append("# fmt: on")
    lines.append("")
    return "\n".join(lines)
