#!/bin/sh

# dependencies:
# i3lock-color

dark_shade='#000000dd'
darker_shade='#000000dd'
green='#239F9A'
yellow='#2D628A'
red='#BA274A'
white='#93e0d0'
black='#3c3836'
blacker='#282828'

font='JetBrainsMonoNF'
font_size=32
font_size_small=17

time_str='%H:%M:%S'
date_str='%d %b %Y'

modif_pos='ix:iy-50'
time_pos='ix:iy'
status_pos='ix:iy'
date_pos='ix:iy+40'

one_word_args=(
	'--nofork'
	'--ignore-empty-password'

	'--indicator'
	'--clock'

	'--blur 10'
	'--radius 120'
	'--ring-width 12.0'

	# the idle color for the interior circle and ring
	"--inside-color=$dark_shade"
	"--ring-color=$green"

	# the interior circle and ring color while the
	# password is being verified
	"--insidever-color=$dark_shade"
	"--ringver-color=$yellow"

	# the interior circle and ring color for during
	# incorrect password flashes.
	"--insidewrong-color=$dark_shade"
	"--ringwrong-color=$red"

	# the color for the line separating the inside circle
	# and the outer ring.
	"--line-color=$darker_shade"

	# the color of highlight arcs on the ring upon
	# keypress and backspace.
	"--keyhl-color=$white"
	"--bshl-color=$black"

	# the color of the seperators at both ends of the
	# highlight arcs on the ring.
	"--separator-color=$blacker"

	# the color of the status text while verifying and
	# when password is wrong and others.
	"--verif-color=$white"
	"--wrong-color=$white"
	"--modif-color=$white"
	"--layout-color=$white"
	"--time-color=$white"
	"--date-color=$white"
	"--greeter-color=$white"

	# set font sizes"
	"--time-size=$font_size"
	"--layout-size=$font_size"
	"--verif-size=$font_size"
	"--wrong-size=$font_size"
	"--greeter-size=$font_size"
	"--date-size=$font_size_small"

	# set positions
	"--time-pos=$time_pos"
	"--date-pos=$date_pos"
	"--status-pos=$status_pos"
	"--modif-pos=$modif_pos"
)

paused=$(dunstctl is-paused)

dunstctl set-paused true


i3lock ${one_word_args[@]} \
	--time-font="$font" \
	--date-font="$font" \
	--layout-font="$font" \
	--verif-font="$font" \
	--wrong-font="$font" \
	--greeter-font="$font" \
	\
	--time-str="$time_str" \
	--date-str="$date_str" \
  -n; dunstctl set-paused $paused
