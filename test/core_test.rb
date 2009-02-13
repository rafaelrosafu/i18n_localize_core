require File.dirname(__FILE__) + '/test_helper'

class CoreTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end
  
  def test_locale_should_be_en
    assert_equal :en, I18n.locale
  end
  
  def test_thousand_separator_should_be_a_comma
    assert_equal ',', I18n.thousand_separator
  end
  
  def test_decimal_separator_should_be_a_period
    assert_equal '.', I18n.decimal_separator
  end
  
  def test_reload_should_call_initialize_separators
    I18n.expects :initialize_separators
    I18n.reload!
  end
  
  def test_changing_locale_should_call_initialize_separators
    I18n.expects :initialize_separators
    I18n.locale = :'pt-br'
  end
  
  def test_lookup_translation_should_retrive_lookup_works
    assert_equal 'lookup works', I18n.lookup_translation(:en, :test_lookup)
  end
end
