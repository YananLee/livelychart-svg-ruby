require "minitest/autorun"
require_relative "lib/livelychart_svg"

class LivelyChartSvgTest < Minitest::Test
  def test_escapes_label
    svg = LivelyChartSvg.render([["<x>", 3]])
    refute_includes svg, "<x>"
    assert_includes svg, "&lt;x&gt;"
  end

  def test_rejects_negative
    assert_raises(ArgumentError) { LivelyChartSvg.render([["x", -1]]) }
  end
end
