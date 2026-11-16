# LivelyChart SVG for Ruby

A dependency-free Ruby gem that makes a basic animated horizontal bar chart SVG. It runs locally. For spreadsheet import, more chart templates, and video export, use [LivelyChart](https://www.livelychart.com/).

## Install

```sh
gem install livelychart_svg
```

## Use

```ruby
require "livelychart_svg"

svg = LivelyChartSvg.render([["Nova", 94], ["Orbit", 88]])
File.write("chart.svg", svg)
```

Options: `width`, `height`, `accent`, `background`, and `duration`. Values must be nonnegative. The output is a self-contained animated SVG for web embeds.

## License

MIT.
