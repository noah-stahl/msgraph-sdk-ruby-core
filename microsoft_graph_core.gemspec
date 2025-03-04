# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/microsoft_graph_core/version_information'

Gem::Specification.new do |spec|
  spec.name          = "microsoft_graph_core"
  spec.version       = MicrosoftGraphCore::VersionInformation::VERSION
  spec.authors       = 'Microsoft Corporation'
  spec.email         = 'graphsdkpub+ruby@microsoft.com'

  spec.summary       = "Ruby SDK for Microsoft Graph"
  spec.description   = "The Microsoft Graph Ruby Code SDK provides basic functionality for Microsoft Graph API."
  spec.homepage      = "https://graph.microsoft.com"
  spec.license       = 'MIT'
  spec.metadata      = {
    'bug_tracker_uri' => 'https://github.com/microsoftgraph/msgraph-sdk-ruby-core/issues',
    'changelog_uri'   => 'https://github.com/microsoftgraph/msgraph-sdk-ruby-core/blob/main/CHANGELOG.md',
    'homepage_uri'    => spec.homepage,
    'source_code_uri' => 'https://github.com/microsoftgraph/msgraph-sdk-ruby-core',
    'github_repo'     => 'ssh://github.com/microsoftgraph/msgraph-sdk-ruby-core'
  }
  spec.required_ruby_version = '>= 3.0.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'microsoft_kiota_abstractions', '~> 0.14.0'
  spec.add_runtime_dependency 'microsoft_kiota_faraday', '>= 0.12', '< 0.15'
  spec.add_runtime_dependency 'microsoft_kiota_serialization_json', '~> 0.9.0'
  spec.add_runtime_dependency 'microsoft_kiota_authentication_oauth', '~> 0.8.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency "rspec", "~> 3.0"
end
