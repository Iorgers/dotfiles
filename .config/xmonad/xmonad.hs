import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Hooks.FadeInactive

main :: IO()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.75

myLayout = tiled ||| Mirror tiled ||| Full
    where
        tiled    = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ Tall nmaster delta ratio
        nmaster  = 1
        ratio    = 1/2
        delta    = 3/100

myStartupHook = do
    spawn "nitrogen --restore &"
    spawn "picom &"

myConfig = def
    { modMask = mod4Mask
    , terminal = "alacritty"
    , layoutHook = myLayout
    , logHook = myLogHook
    , borderWidth = 0
    , startupHook = myStartupHook
    }
    `additionalKeysP`
    [ ("M-f", spawn "google-chrome-stable")
    ]
