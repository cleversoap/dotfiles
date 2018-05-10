import XMonad
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.BinarySpacePartition (emptyBSP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Spacing

import XMonad.Layout.Maximize

myTerminal = "alacritty"

myBorderWidth = 1

myModMask = mod4Mask

myNormalBorderColor = "#dddddd"

myFocusedBorderColor = "#ff0000"

-- Keybindings
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((modMask,            xK_Return), spawn $ XMonad.terminal conf)

    -- application launcher
    , ((modMask,            xK_p     ), spawn "xfrun4")

    -- rotate through layouts
    , ((modMask,            xK_space ), sendMessage NextLayout)

    -- focus next window
    , ((modMask,            xK_j     ), windows W.focusDown)

    -- focus previous window
    , ((modMask,            xK_k     ), windows W.focusUp)

    -- push window back into tiling
    , ((modMask,            xK_t     ), withFocused $ windows . W.sink)]

    ++

    -- Move workspace and move window to workspace
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- Mouse focus
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Layout hook
myLayouts = toggleLayouts (noBorders Full) others
    where
        others = avoidStruts $ smartSpacing 10 $ ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP

-- Window hooks
myManageHook = composeAll [
        className =? "Xfce4-appfinder"  --> doFloat,
        className =? "Xfrun4"           --> doFloat,
        resource =? "desktop_window"    --> doIgnore
    ]

-- Main
main = do

    xmonad $ desktopConfig {

        -- simple stuff
        terminal            = myTerminal,
        borderWidth         = myBorderWidth,
        modMask             = myModMask,
        normalBorderColor   = myNormalBorderColor,
        focusedBorderColor  = myFocusedBorderColor,
        keys                = myKeys,

        -- hooks, layouts
        layoutHook          = myLayouts,
        manageHook          = myManageHook

    }
