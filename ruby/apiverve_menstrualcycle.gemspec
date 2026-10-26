# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_menstrualcycle"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Menstrual Cycle Calculator API - Ruby Client"
  spec.description   = "Menstrual Cycle Calculator is a period tracker API that predicts future menstrual cycles, fertile windows, and ovulation dates from the last period date and the average cycle and period length."
  spec.homepage      = "https://apiverve.com/marketplace/menstrualcycle?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/menstrualcycle-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/menstrualcycle"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
