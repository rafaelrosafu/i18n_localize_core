# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{i18n_localize_core}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rafael Rosa Fu"]
  s.date = %q{2009-02-13}
  s.description = %q{TODO}
  s.email = %q{rafaelrosafu@gmail.com}
  s.files = ["README.rdoc", "VERSION.yml", "lib/i18n_localize_core.rb", "lib/i18n_localize_core", "lib/i18n_localize_core/date_extensions.rb", "lib/i18n_localize_core/string_extensions.rb", "lib/i18n_localize_core/i18n_extensions.rb", "lib/i18n_localize_core/number_extensions.rb", "test/core_test.rb", "test/i18n_parse_date_test.rb", "test/string_class_test.rb", "test/api_test.rb", "test/i18n_parse_number_test.rb", "test/string_class_to_i_test.rb", "test/date_class_test.rb", "test/test_helper.rb", "test/string_class_to_f_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rafaelrosafu/i18n_localize_core}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Uses I18n to localize dates and numbers automatically and add parse class methods to I18n}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
