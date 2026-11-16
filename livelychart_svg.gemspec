Gem::Specification.new do |spec|
  spec.name = "livelychart_svg"
  spec.version = "0.1.1"
  spec.summary = "Generate a simple animated bar chart SVG"
  spec.description = "A small local SVG generator for embeddable animated horizontal bar charts."
  spec.authors = ["LivelyChart"]
  spec.homepage = "https://www.livelychart.com/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6"
  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]
  spec.metadata = { "source_uri" => "https://github.com/YananLee/livelychart-svg-ruby" }
end
