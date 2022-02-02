#!/bin/sh
# Used in conjunction with my fish `sdf` function for swallowing in BSPWM.
$@ &
disown
