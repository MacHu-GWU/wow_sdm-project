What is SDM
==============================================================================


SDM Overview
------------------------------------------------------------------------------
`SuperDuperMacro (SDM) <https://www.wowinterface.com/downloads/info10496-SuperDuperMacro.html>`_ 是一款宏命令管理插件. 它允许用户突破一个宏命令最多 255 个字符的限制 (通过 API 实现). 3.3.5 版本的这个插件下载网上已经找不到了. 这个链接是一个很多年前的介绍, 已经很久没有更新了.


How SDM Work
------------------------------------------------------------------------------
你在游戏中用 SDM 插件编辑了宏命令之后退出游戏时, SDM 就会将宏命令保存到 .lua 文件. 而每次启动游戏时候 SDM 会自动将这些宏数据通过 API 发送给服务器端保持同步. 它支持自定义宏命令的 ID, 并且支持几乎无限长度的宏命令, 这点特别适合写一键输出循环.

这里有一个 SuperDuperMacro.lua 的例子, 你可以看到它的代码结构:

.. dropdown:: SuperDuperMacro.lua

    .. literalinclude:: ./SuperDuperMacro.lua
       :language: lua
       :linenos:


How SDM Solve the Problem
------------------------------------------------------------------------------
本节我们来看看 SDM 插件是如何解决 :ref:`what-is-this` 中提到的问题的.

1. ``.lua`` 文件只会被插件所管理, 而不会被服务器给覆盖掉. **这种本地优先的设定保证了无论服务器端出了什么故障, 我们本地都有完整的数据*.
2. SDM 会将本地 ``.lua`` 中的定义通过 API 发送给服务器, 从而保证本地的 ID 和服务器端的记录严格对应一致, **进一步保证了动作条 ID 和宏命令 ID 的对应关系的稳定性**.
3. 由于宏命令是用 lua 文件的形式保存的, 所以我们 **可以用编程语言中的注释功能给宏命令添加注释**.
4. SDM 支持任意长度的宏命令.
5. SDM 永远以本地 ``.lua`` 为准, 换机器时只需要拷贝 ``.lua`` 文件即可.
6. ``.lua`` 文件是结构化的, 我们可以用更加方便编写的文件格式, 例如 YAML 来编写, 而动态生成最终的 ``.lua`` 文件.


How This Project Solve the Problem
------------------------------------------------------------------------------
到这里我们的完整解决方案就呼之欲出了. 我们可以把游戏中的宏命令用 SDM 插件管理. 而我们这个软件只是提供了一套方便于人类管理大量宏命令的框架, 允许人类用文件夹层级结构 + YAML 来管理宏命令的内容. 然后只需要用配置文件来制定每个游戏角色在游戏中要用哪些宏命令既可. 这个软件最终会根据你的配置生成最终的 ``.lua`` 文件, 然后登录游戏后 SDM 会自动将这些宏命令同步到服务器端.

举例来说, :class:`~wow_sdm.exp03_wotlk.model.SdmMacro` 类代表着一个宏命令. 你可以用 :meth:`SdmMacro.from_yaml <wow_sdm.exp03_wotlk.model.SdmMacro.from_yaml>` 方法来从 YAML 文件中读取宏命令的数据. 下面是一个宏命令的 YAML 文件的例子. 可以看到, 里面定义了宏命令的内容, 还有 description, 并且你可以任意插入注释.

.. dropdown:: 02-paladin/1-protect-retri/11305-rotation-zhCN.yml

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_macros/02-paladin/1-protect-retri/11305-rotation-zhCN.yml
       :language: python
       :linenos:


What's Next
------------------------------------------------------------------------------
接下来我来介绍如何使用这个项目 + SDM 插件来管理宏命令.


SDM Introduction Backup
------------------------------------------------------------------------------
下面是我从 wowinterface.com 上找到的 SDM 插件的介绍, 这里留个备份档. (备份于 2024-06-24)

Super Duper Macro  Popular! (More than 5000 hits)
Version: 8.2.5.0by: hypehuman, spiralofhope
This addon is under new maintenance

WowInterface will be kept up-to-date, but still needs to be cleaned up a bit. The source code, a list of all past releases, documentation, and issue tracker, can be found at:

https://github.com/spiralofhope/SuperDuperMacro

This description still needs to be audited.

To view recent changes, click the "Change Log" tab at the top of this page.

Open the in-game interface by typing /sdm

This addon allows you to create macros beyond the 255-character limit, and even beyond the 1023-character macrotext limit. However, no individual line in a macro may be more than 1023 characters long (you will get a warning). The number of lines is unlimited. Super Duper Macro also allows you to share macros with your friends in-game.

This mod allows you to make two types of macros:

- Button macros are just like regular macros, but they can be as long as you want. You cannot make an unlimited number of them; they share a limit with your regular macros (36 global and 18 character-specific for each character).
- Floating macros do not have buttons, and are accessed by /click. You can make as many of these as you want.
- You can also make lua scripts of unlimited length that you can call using "/sdm run <name>" or via sdm_RunScript("name")

Suggestions and bug reports are always welcome. You can post comments on the wowinterface.com page for this addon, or if you want to add something yourself, you can upload it in the "Optional Files" tab.

Alternately, create a pull request to my GitHub repo: https://github.com/hypehuman/super-duper-macro

Special thanks to:

- SuperMacro, which inspired the idea for this addon.
- All the regulars on the UI & Macro forums, who taught me how to program for WoW.
