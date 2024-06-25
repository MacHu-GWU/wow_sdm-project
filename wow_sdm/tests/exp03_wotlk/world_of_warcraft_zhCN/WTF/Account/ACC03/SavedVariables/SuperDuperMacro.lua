sdm_version = "1.8.3"
sdm_listFilters = {
	["true"] = true,
	["s"] = true,
	["b"] = true,
	["false"] = true,
	["global"] = true,
	["f"] = true,
}
sdm_iconSize = 36
sdm_mainContents = {
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1131,
    1132,
    1151,
    1152,
    1153,
    1173,
    1174,
    1175,
    1176,
    14102,
    14311,
    14111,
    14112,
    14114,
    14312,
}
sdm_macros = {
    [1001] = {
        ["type"] = "b",
        ["name"] = "Respawn",
        ["ID"] = 1001,
        ["icon"] = 1066,
        ["text"] = "/cleartarget\n.respawn\n#.respawn all",
    },
    [1002] = {
        ["type"] = "b",
        ["name"] = "Feigh-Death",
        ["ID"] = 1002,
        ["icon"] = 353,
        ["text"] = "/target player\n.aura 5384\n/targetlasttarget",
    },
    [1003] = {
        ["type"] = "b",
        ["name"] = "Reset-Cooldown",
        ["ID"] = 1003,
        ["icon"] = 9,
        ["text"] = "/target player\n.cooldown\n/targetlasttarget",
    },
    [1004] = {
        ["type"] = "b",
        ["name"] = "Ice-Block",
        ["ID"] = 1004,
        ["icon"] = 644,
        ["text"] = "/target player\n.aura 45438\n.unaura 45438\n/targetlasttarget",
    },
    [1005] = {
        ["type"] = "b",
        ["name"] = "Resurrection",
        ["ID"] = 1005,
        ["icon"] = 771,
        ["text"] = "/g .revive",
    },
    [1006] = {
        ["type"] = "b",
        ["name"] = "Invisibility",
        ["ID"] = 1006,
        ["icon"] = 814,
        ["text"] = "/target player\n#.npcbot command stay\n.aura 32612",
    },
    [1007] = {
        ["type"] = "b",
        ["name"] = "Unbind-Instance",
        ["ID"] = 1007,
        ["icon"] = 797,
        ["text"] = ".instance unbind all",
    },
    [1008] = {
        ["type"] = "b",
        ["name"] = "Fly-Up",
        ["ID"] = 1008,
        ["icon"] = 239,
        ["text"] = "/target player\n.aura 31700\n/targetlasttarget",
    },
    [1009] = {
        ["type"] = "b",
        ["name"] = "Fly-Down",
        ["ID"] = 1009,
        ["icon"] = 239,
        ["text"] = "/target player\n/dismount\n.modify speed all 1\n#.unaura 39870\n#.aura 39870\n/targetlasttarget",
    },
    [1010] = {
        ["type"] = "b",
        ["name"] = "x32-Speed",
        ["ID"] = 1010,
        ["icon"] = 590,
        ["text"] = "/target player\n.modify speed all 32\n/targetlasttarget",
    },
    [1011] = {
        ["type"] = "b",
        ["name"] = "Mount-Up",
        ["ID"] = 1011,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/stopmacro [mounted]\n/cast [flyable] X-53型觀光火箭\n/cast [noflyable] 旅者的凍原長毛象",
    },
    [1012] = {
        ["type"] = "b",
        ["name"] = "Mount-Down",
        ["ID"] = 1012,
        ["icon"] = 340,
        ["text"] = "#showtooltip\n/cancelaura [mounted] X-53型觀光火箭\n/cancelaura [mounted] 旅者的凍原長毛象",
    },
    [1101] = {
        ["type"] = "b",
        ["name"] = "Target-Party",
        ["ID"] = 1101,
        ["icon"] = 179,
        ["text"] = "/targetparty",
    },
    [1102] = {
        ["type"] = "b",
        ["name"] = "Target-Raid",
        ["ID"] = 1102,
        ["icon"] = 179,
        ["text"] = "/targetraid",
    },
    [1103] = {
        ["type"] = "b",
        ["name"] = "Target-Focus-Target",
        ["ID"] = 1103,
        ["icon"] = 180,
        ["text"] = "/assist focus",
    },
    [1104] = {
        ["type"] = "b",
        ["name"] = "Target-Focus-Target-Target",
        ["ID"] = 1104,
        ["icon"] = 180,
        ["text"] = "/assist focus\n/assist",
    },
    [1105] = {
        ["type"] = "b",
        ["name"] = "Confirm",
        ["ID"] = 1105,
        ["icon"] = 542,
        ["text"] = "/click StaticPopup1Button1",
    },
    [1106] = {
        ["type"] = "b",
        ["name"] = "Set-Focus",
        ["ID"] = 1106,
        ["icon"] = 1057,
        ["text"] = "/focus",
    },
    [1107] = {
        ["type"] = "b",
        ["name"] = "Clear-Focus",
        ["ID"] = 1107,
        ["icon"] = 1058,
        ["text"] = "/clearfocus",
    },
    [1108] = {
        ["type"] = "b",
        ["name"] = "Set-High-FPS",
        ["ID"] = 1108,
        ["icon"] = 39,
        ["text"] = "/console maxfps 30",
    },
    [1109] = {
        ["type"] = "b",
        ["name"] = "Set-Low-FPS",
        ["ID"] = 1109,
        ["icon"] = 40,
        ["text"] = "/console maxfps 5",
    },
    [1110] = {
        ["type"] = "b",
        ["name"] = "Follow-Focus",
        ["ID"] = 1110,
        ["icon"] = 138,
        ["text"] = "/follow focus",
    },
    [1131] = {
        ["type"] = "b",
        ["name"] = "Target-Window-01",
        ["ID"] = 1131,
        ["icon"] = 129,
        ["text"] = "/tar sa",
    },
    [1132] = {
        ["type"] = "b",
        ["name"] = "Target-Window-10",
        ["ID"] = 1132,
        ["icon"] = 129,
        ["text"] = "/tar rj",
    },
    [1151] = {
        ["type"] = "b",
        ["name"] = "Invite-Raid",
        ["ID"] = 1151,
        ["icon"] = 1080,
        ["text"] = "/inv sa\n/inv sb\n/inv sc\n/inv sd\n/inv se",
    },
    [1152] = {
        ["type"] = "b",
        ["name"] = "Leave-Raid",
        ["ID"] = 1152,
        ["icon"] = 1081,
        ["text"] = "/script LeaveParty()",
    },
    [1153] = {
        ["type"] = "b",
        ["name"] = "Summon",
        ["ID"] = 1153,
        ["icon"] = 1068,
        ["text"] = ".summon sa\n.summon sb\n.summon sc\n.summon sd\n.summon se",
    },
    [1173] = {
        ["type"] = "b",
        ["name"] = "Tele-Orgrimmar",
        ["ID"] = 1173,
        ["icon"] = 532,
        ["text"] = ".go xyz 1678.0 -4314.0 61.4 1",
    },
    [1174] = {
        ["type"] = "b",
        ["name"] = "Tele-Undercity",
        ["ID"] = 1174,
        ["icon"] = 539,
        ["text"] = ".go xyz 1568.0 262.0 -43.1 0",
    },
    [1175] = {
        ["type"] = "b",
        ["name"] = "Tele-Shattrath",
        ["ID"] = 1175,
        ["icon"] = 533,
        ["text"] = ".go xyz -1834 5303 -12.43 530",
    },
    [1176] = {
        ["type"] = "b",
        ["name"] = "Tele-Dalaran",
        ["ID"] = 1176,
        ["icon"] = 527,
        ["text"] = ".go xyz 5813 448 658.75 571",
    },
    [14102] = {
        ["type"] = "b",
        ["name"] = "Interrupt",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14102,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/stopcasting\n/cast [target=focus,harm] 风剪; [target=focustarget,harm] 风剪; [] 风剪",
    },
    [14311] = {
        ["type"] = "b",
        ["name"] = "Buff-Self",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14311,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/castsequence [spec:1] reset=target 火舌武器,水之护盾\n/castsequence [spec:2] reset=target 大地生命武器,水之护盾",
    },
    [14111] = {
        ["type"] = "b",
        ["name"] = "Elemental-Rotate",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14111,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/castsequence reset=15 烈焰震击,闪电链,闪电箭,闪电箭,闪电箭,闪电链,闪电箭,闪电箭,闪电箭",
    },
    [14112] = {
        ["type"] = "b",
        ["name"] = "Resto-Rotate",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14112,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/targetraid\n/castsequence reset=6 激流,治疗链,水之护盾,治疗波,次级治疗波",
    },
    [14114] = {
        ["type"] = "b",
        ["name"] = "MB-Retro-Earth-Shield",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14114,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/castsequence 大地之盾,,大地之盾,,水之护盾,,",
    },
    [14312] = {
        ["type"] = "b",
        ["name"] = "Burst",
        ["character"] = {
            ["name"] = "Myshaman2",
            ["realm"] = "realm1",
        },
        ["ID"] = 14312,
        ["icon"] = 1,
        ["text"] = "#showtooltip\n/stopcasting\n/cast [spec:1] 元素掌握\n/cast [spec:2] 潮汐之力",
    },
}