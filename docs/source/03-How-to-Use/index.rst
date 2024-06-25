How to Use
==============================================================================
下面我们将介绍如何使用这个项目. 我们假设我们刚来到一个 WotLK 巫妖王之怒版本的服务器, 我们建立了 5 个游戏账号, 每个账号上有 1 个角色, 它们分别是一个 防护/惩戒 (主防护) 骑士, 三个 元素/恢复 (主元素) 萨满, 一个 元素/恢复 (主恢复) 的萨满.

.. note::

    这个项目支持多个不同的 WOW 版本, 因为它们的客户端 WTF 目录结构大同小异. 虽然这篇文档是以人气较高的 WotLK 版本为例, 但是你在使用其他版本时依然可以参考本文.

    - :mod:`wow_sdm.exp03_wotlk`

.. note::

    在 `wow_sdm/tests/exp03_wotlk <https://github.com/MacHu-GWU/wow_sdm-project/tree/main/wow_sdm/tests/exp03_wotlk>`_ 目录有一个完整的如何使用这个库项目来管理你的宏命令的例子. 请在阅读本文时跟这个例子互相印证.


.. _account-and-character-configuration:

1. Account and Character Configuration
------------------------------------------------------------------------------
.. note::

    这部分的功能由另一个库 `wow_acc <https://pypi.org/project/wow-acc/>`_ 提供. 你可以参考 `这篇文档 <https://github.com/MacHu-GWU/wow_acc-project>`_ 来了解如何枚举你的账号和角色.

**首先你要枚举你的账号和角色**.

我们在 `acc_dataset.yml <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/acc_dataset.yml>`_ 文件中定义了我们的游戏账号和角色.

.. dropdown:: wow_sdm/tests/exp03_wotlk/acc_dataset.yml

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/acc_dataset.yml
       :language: yaml
       :linenos:

然后我们编写了一个 `acc_dataset.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/acc_dataset.py>`_ 脚本用于生成对所有账号和角色的 enum 模块.

.. dropdown:: wow_sdm/tests/exp03_wotlk/acc_dataset.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/acc_dataset.py
       :language: python
       :linenos:

现在我们就得到了一个可以用 Python 变量引用我们的账号和角色的 `acc_enum.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/acc_enum.py>`_ 模块了.

.. dropdown:: wow_sdm/tests/exp03_wotlk/acc_enum.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/acc_enum.py
       :language: python
       :linenos:

更进一步地, 你可以按照逻辑对这些账号和角色的 enum 进行分组, 这样在之后引用的时候就可以批量引用而不用一个个的手打了. `acc_group.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/acc_group.py>`_ 模块是一个很好的例子.

.. dropdown:: wow_sdm/tests/exp03_wotlk/acc_group.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/acc_group.py
       :language: python
       :linenos:


2. Craft Your Macro Catalogs
------------------------------------------------------------------------------
下面我们就会开始编写一个非常庞大的宏命令库了.

`exp03_wotlk/sdm_macros <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_macros/>`_ 目录下有一些 YAML 文件和文件夹. 每个 YAML 文件就是一个宏命令. 例如在 `02-paladin/1-protect-retri/11305-rotation-zhCN.yml <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_macros/02-paladin/1-protect-retri/11305-rotation-zhCN.yml>`_ 就是一个 防护/惩戒 骑士的输出循环宏.

.. dropdown:: 02-paladin/1-protect-retri/11305-rotation-zhCN.yml

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_macros/02-paladin/1-protect-retri/11305-rotation-zhCN.yml
       :language: python
       :linenos:

这个目录结构只是我认为最合理的结构, 你可以使用你喜欢的任何目录结构. 不过我在 `exp03_wotlk/sdm_macros/README.rst <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_macros/README.rst>`_ 文件中详细阐述了我的目录结构为什么这样设计. 我建议你查看 `exp03_wotlk/sdm_macros <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_macros/>`_ 里的 yaml 文件, 学习了解之后再考虑设计你自己的目录结构.


.. _generate-macro-enum-module:

3. Generate Macro Enum Module
------------------------------------------------------------------------------
和 :ref:`account-and-character-configuration` 类似, **我们也要将我们的宏命令转化成一个 Python 模块, 使得每一个宏命令文件都是一个 enum**.

我们编写了一个 `sdm_dataset.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_dataset.py>`_ 脚本用于生成对所有配置文件的 enum 模块.

.. dropdown:: wow_sdm/tests/exp03_wotlk/sdm_dataset.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_dataset.py
       :language: python
       :linenos:

现在我们就得到了一个可以用 Python 变量引用我们的配置文件的 `sdm_enum.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_enum.py>`_ 模块了.

.. dropdown:: wow_sdm/tests/exp03_wotlk/sdm_enum.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_enum.py
       :language: python
       :linenos:

更进一步地, 你可以按照逻辑对这些 enum 进行分组, 这样在之后引用的时候就可以批量引用而不用一个个的手打了. `sdm_group.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_group.py>`_ 模块是一个很好的例子.

.. dropdown:: wow_sdm/tests/exp03_wotlk/sdm_group.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_group.py
       :language: python
       :linenos:


4. Define Your Account / Character and Macro Mapping
------------------------------------------------------------------------------
**我们有了 Account / Character 的 Enum, 也有了 WTF Config 的 Enum, 下面就是要指定哪些账号和角色应该使用哪些配置了**. 这个映射关系叫做 mapping.

我们需要编写一个 `sdm_mapping.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_mapping.py>`_ 模块, 里面导入了我们之前定义的 `acc_enum.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/acc_enum.py>`_ 和 `wtf_enum.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/wtf_enum.py>`_ Enum.

.. dropdown:: wow_sdm/tests/exp03_wotlk/sdm_mapping.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_mapping.py
       :language: python
       :linenos:

接下来就是定义 :class:`~wow_sdm.exp03_wotlk.mapping.SdmMapping` 对象, 它是一个 mapping 数据的容器. 里面定义了例如 account 和 character 级别的宏命令.

``wow_sdm`` 库还提供了一些函数能让你更方便地定义这些 mapping 数据. 例如:

- :meth:`~wow_sdm.exp03_wotlk.mapping.AccLvlMapping.make_many` 和 :meth:`~wow_sdm.exp03_wotlk.mapping.CharLvlMapping.make_many` 方法可以方便地让你将多个账户或角色和多个配置文件建立映射关系.
- :func:`~wow_sdm.utils.get_values` 方法可以方便地让你获得一个 enum 类的所有 member 的集合. 注意这里是集合, 也就是说你可以用 ``difference`` (取差异), ``intersection`` (取交集), ``union`` (取并集) 这些集合操作进行筛选.
- :func:`~wow_sdm.utils.concat_lists` 方法可以方便地让你将多个 list 连接起来.


5. Apply Macros
------------------------------------------------------------------------------
有了 :class:`~wow_sdm.exp03_wotlk.mapping.SdmMapping` 对象之后, **你就可以将你的配置批量应用到你的客户端了**. 你可以使用下面 :meth:`wow_sdm.exp03_wotlk.mapping.SdmMapping.apply` 方法来将你的宏命令写入到客户端的 ``WTF/Account/MYACCOUNT/SavedVariables/SuperDuperMacro.lua`` 文件中:

`sdm_apply.py <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/sdm_apply.py>`_ 文件是一个例子, 它展示了如何将我们的配置应用到我们的客户端.

.. dropdown:: wow_sdm/tests/exp03_wotlk/sdm_apply.py

    .. literalinclude:: ../../../wow_sdm/tests/exp03_wotlk/sdm_apply.py
       :language: python
       :linenos:

**How to debug before you apply**

由于 ``apply`` 操作会覆盖 WTF 中已有的文件. 所以在你还不确定你的代码是否正确之前, 你希望能提前进行验证, 或是确保出现问题时能够回滚到之前的状态. 我推荐下面几种方法:

1. 备份你客户端中的 WTF 文件夹, 以备不时之需.
2. 在定义 :class:`~wow_sdm.exp03_wotlk.mapping.Client` 时将目录指向到一个临时目录, 而不是真正的魔兽世界客户端目录. 这样你可以检查生成后的文件, 然后拷贝一小部分到客户端中看看是否惯用.
3. 在调用 ``apply(...)`` 方法时, 将 ``real_run`` 参数设为 ``False``. 这样它只会渲染最终要写入的内容而不会真正写入. 这样可以确定你至少你的 lua 文件没有问题.


Manage Multiple Servers and Mappings
------------------------------------------------------------------------------
本节介绍了在你同时玩多个服务器的时候, 有多个客户端, 有多套人物角色和配置的组合的时候, 如何组织你的文件目录来管理数量庞大的 WTF 配置.

首先我们要知道一些规范:

- 用不同的客户端玩不同的服务器. 例如你在用一个客户端玩 2 个私服. 那么建议把你的游戏客户端拷贝一份, 每一个客户端玩不同的私服. 因为不同的私服的服务器名和游戏角色名可能会出现冲突.
- 不要用多个 mapping 来分别管理一个账号下的不同角色. 举例来说, 你一个账号下有 10 个角色, 你用一套 mapping 管理其中的 5 个, 另一套 mapping 管理另外 5 个. 这样是不可以的. 因为 SDM 的插件 lua 文件是账号级别的. 如果你的配置只涉及到其中的 5 个角色, 那么一旦你登录另外的 5 个角色中的任意一个, 那么登录的角色里的宏命令就丢失了, 导致动作条混乱, 并且这个动作条还会被保存到服务器上.
- 跟上一条对应, 你可以用多个 mapping 来管理一个服务器上的不同账号. 例如用一套 mapping 管理 5 个账号, 用另一套 mapping 管理另外 5 个账号, 这样做是可以的.

根据这些规范, 我们可以创建下面的目录结构. 在 workspace 下的每一个子目录都应该是一套独立的 mapping. 子目录的文件夹名可以是 ``${server_name}_${description}``. 其中 ``server_name`` 是服务器的名字, ``description`` 是你这套 mapping 的描述. 而这些子目录的结构就跟 `exp03_wotlk <https://github.com/MacHu-GWU/wow_sdm-project/blob/main/wow_sdm/tests/exp03_wotlk/>`_ 目录下的结构一样了.
