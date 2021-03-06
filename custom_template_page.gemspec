lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_template_page/version'

Gem::Specification.new do |spec|
  spec.name          = 'custom_template_page'
  spec.version       = CustomTemplatePage::VERSION
  spec.authors       = ['negi0109']
  spec.email         = ['negi0109.seg@gmail.com']

  spec.summary       = 'User-customizable Page library'
  spec.description   = 'User-customizable Page library'
  spec.homepage      = 'https://github.com/negi0109/ruby_custom_template_page'
  spec.license       = 'MIT'

  # Only with ruby 2.6.x
  spec.required_ruby_version = '~> 2.4'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/negi0109/ruby_custom_template_page'
    spec.metadata['changelog_uri'] = 'https://github.com/negi0109/ruby_custom_template_page/releases'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.90'
end
