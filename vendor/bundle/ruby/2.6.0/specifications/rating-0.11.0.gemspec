# -*- encoding: utf-8 -*-
# stub: rating 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rating".freeze
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Washington Botelho".freeze]
  s.date = "2020-01-16"
  s.description = "A true Bayesian rating system with scope and cache enabled.".freeze
  s.email = "wbotelhos@gmail.com".freeze
  s.homepage = "https://github.com/wbotelhos/rating".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A true Bayesian rating system with scope and cache enabled.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<factory_bot_rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<factory_bot_rails>.freeze, [">= 0"])
      s.add_dependency(%q<mysql2>.freeze, [">= 0"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<factory_bot_rails>.freeze, [">= 0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
  end
end
