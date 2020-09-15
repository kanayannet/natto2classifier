
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "natto2classifier/version"

Gem::Specification.new do |spec|
  spec.name          = "natto2classifier"
  spec.version       = Natto2classifier::VERSION
  spec.authors       = ["kanayannet"]
  spec.email         = ["kanayannet@gmail.com"]

  spec.summary       = %q{It is a library that classifies Japanese language.}
  spec.description   = %q{It is a library that classifies Japanese language. It depends on classifier-reborn and natto.}
  spec.homepage      = "https://github.com/kanayannet/natto2classifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "natto"
  spec.add_runtime_dependency "classifier-reborn"
  spec.add_runtime_dependency "rb-gsl"
end
