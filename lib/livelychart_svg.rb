# frozen_string_literal: true

require "cgi"

module LivelyChartSvg
  def self.render(bars, width: 800, height: 480, accent: "#635bff", background: "#ffffff", duration: 1.2)
    raise ArgumentError, "provide 1 to 30 bars" unless bars.is_a?(Array) && (1..30).cover?(bars.length)
    raise ArgumentError, "invalid options" unless width.is_a?(Integer) && width >= 300 && height.is_a?(Integer) && height >= 100 && duration.is_a?(Numeric) && duration.finite? && duration.positive?
    raise ArgumentError, "colors must be #RRGGBB" unless [accent, background].all? { |color| color.match?(/\A#[0-9a-fA-F]{6}\z/) }

    pairs = bars.map do |label, value|
      raise ArgumentError, "bars need labels and finite nonnegative values" if label.to_s.strip.empty? || !value.is_a?(Numeric) || !value.finite? || value.negative?
      [label.to_s, value]
    end
    max = [pairs.map(&:last).max, 1].max
    row = (height - 40.0) / pairs.length
    bar_height = [32, row * 0.55].min
    plot_width = width - 270.0
    svg = +%(<svg xmlns="http://www.w3.org/2000/svg" width="#{width}" height="#{height}" viewBox="0 0 #{width} #{height}" role="img" aria-label="Animated bar chart">)
    svg << %(<rect width="100%" height="100%" fill="#{background}"/>)
    pairs.each_with_index do |(label, value), index|
      y = 20 + row * index + (row - bar_height) / 2
      bar_width = plot_width * value / max
      svg << %(<text x="20" y="#{format('%.1f', y + bar_height / 2)}" dominant-baseline="middle" font-family="Arial, sans-serif" font-size="16" fill="#222222">#{CGI.escapeHTML(label)}</text>)
      svg << %(<rect x="180" y="#{format('%.1f', y)}" width="0" height="#{format('%.1f', bar_height)}" rx="5" fill="#{accent}"><animate attributeName="width" from="0" to="#{format('%.1f', bar_width)}" dur="#{format('%.2f', duration)}s" begin="#{format('%.2f', index * 0.1)}s" fill="freeze"/></rect>)
      svg << %(<text x="#{format('%.1f', 190 + bar_width)}" y="#{format('%.1f', y + bar_height / 2)}" dominant-baseline="middle" font-family="Arial, sans-serif" font-size="15" fill="#222222">#{value}</text>)
    end
    svg << "</svg>"
  end
end
