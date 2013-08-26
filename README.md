# Optimal rollover calculator

A simple Ruby script to iterate over a range of dates by day to calculate the total validity period of a set of recurring data bundles that are allocated at different intervals to when they expire.

The code checked in here is written for bundles that recur every 30 days and expire at the end of the following month.

For the script to work you'll probably need Ruby 1.9.3 or newer, as the `step` method is not available in older versions of the Ruby standard library (if Ruby-doc is to be believed).

Since I'm not exactly inventing multi-touch here, I thought I might as well unlicense it.