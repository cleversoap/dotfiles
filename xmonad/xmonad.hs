module Main (main) where

import System.Exit
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
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

main = do
    -- Start xmobar taskbar (not working as nothing is being fed to it)
    spawn "xmobar"

    xmonad $ desktopConfig
        { modMask = mod4Mask
        , manageHook = myManageHook <+> manageHook desktopConfig
        , layoutHook = desktopLayoutModifiers $ myLayouts
        , logHook = dynamicLogString def >>= xmonadPropLog
        }

        `additionalKeysP`
        [ ("M-S-q", confirmPrompt myXPConfig "exit" (io exitSuccess))
        , ("M-p", shellPrompt myXPConfig)
        , ("M-<Esc>", sendMessage (Toggle "Full"))
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

    --{ terminal = "urxvt"
    --, modMask = mod4Mask
    --, borderWidth = 3

