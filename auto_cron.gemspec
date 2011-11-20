# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{auto_cron}
  s.version = "0.1.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Farrill"]
  s.date = %q{2011-11-19}
  s.description = %q{Generate a crontab}
  s.email = %q{alex.farrill@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "auto_cron.gemspec",
    "generators/auto_cron/auto_cron_generator.rb",
    "generators/auto_cron/templates/header.erb",
    "generators/auto_cron/templates/publish.erb",
    "install.rb",
    "lib/auto_cron.rb",
    "lib/auto_cron/railtie.rb",
    "lib/capistrano/auto_cron.rb",
    "lib/tasks/auto_cron_tasks.rake",
    "test/helper.rb",
    "test/test_auto_cron.rb"
  ]
  s.homepage = %q{http://github.com/alexfarrill/auto_cron}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generate a crontab}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rake>, ["= 0.9.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rake>, ["= 0.9.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rake>, ["= 0.9.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

