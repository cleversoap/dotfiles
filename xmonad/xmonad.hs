module Main (main) where

import System.Exit
import System.IO
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.BinarySpacePartition (emptyBSP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.Shell
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

main = do
    xmproc <- spawnPipe "xmobar -d"

    xmonad $ desktopConfig
        { modMask = mod4Mask
        , manageHook = myManageHook <+> manageHook desktopConfig
        , layoutHook = desktopLayoutModifiers $ myLayouts
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , terminal = "alacritty"
        , borderWidth = 3
        }

        `additionalKeysP`
        [ ("M-S-q", confirmPrompt myXPConfig "exit" (io exitSuccess))
        , ("M-p", shellPrompt myXPConfig)
        , ("M-<Esc>", sendMessage (Toggle "Full"))
        , ("M-S-r", restart "xmonad" True)
        ]

-- Custom Layouts
myLayouts = toggleLayouts (noBorders Full) others
    where
        others = avoidStruts $ smartSpacing 10 $ ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP

--  Customise Prompt
myXPConfig = def
    { position = Top
    , alwaysHighlight = True
    , promptBorderWidth = 0
    , font = "xft:monospace:size=9"
    }

-- Custom management
myManageHook = composeOne
    [ isDialog -?> doCenterFloat
    , transience
    ]
