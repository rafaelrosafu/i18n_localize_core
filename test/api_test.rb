require File.dirname(__FILE__) + '/test_helper'

class I18nLocalizeCoreAPITest < Test::Unit::TestCase
  def test_require
    assert_nothing_raised {|| require 'i18n' }
  end
  
  def test_if_I18n_has_parse_date
    assert_respond_to I18n, :parse_date
  end
  
  def test_if_I18n_has_parse_number
    assert_respond_to I18n, :parse_number
  end
  
  def test_if_I18n_has_localize_core
    assert_respond_to I18n, :localize_core
  end
  
  def test_if_I18n_has_localize_core=
    assert_respond_to I18n, :localize_core=
  end
  
  def test_if_I18n_has_thousand_separator
    assert_respond_to I18n, :thousand_separator
  end
  
  def test_if_I18n_has_decimal_separator
    assert_respond_to I18n, :decimal_separator
  end
  
  def test_if_I18n_has_reload!
    assert_respond_to I18n, :reload!
  end
  
  def test_if_I18n_has_locale
    assert_respond_to I18n, :locale=
  end
  
  def test_if_I18n_has_lookup_translation
    assert_respond_to I18n, :lookup_translation
  end
  
  def test_should_allow_to_change_default_localize_core
    I18n.localize_core = false
    assert ! I18n.localize_core
  end
end
