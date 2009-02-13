require File.dirname(__FILE__) + '/test_helper'

class I18nParseDateTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end
  
  def test_parse_date_should_return_ArgumentError_unless_receives_string
    assert_raise  ::ArgumentError do
      I18n.parse_date(123)
    end
  end
  
  def test_parse_date_should_work_with_all_locales
    I18n.locale = :en
    assert_equal @reference_date, I18n.parse_date(@localized_date_en)
    I18n.locale = :'pt-br'
    assert_equal @reference_date, I18n.parse_date(@localized_date_pt_br)
  end
  
  def test_parse_date_should_return_nil_when_evaluating_a_invalid_format
    I18n.locale = :en
    assert_nil I18n.parse_date(@localized_date_pt_br)
    I18n.locale = :'pt-br'
    assert_nil I18n.parse_date(@localized_date_en)
  end
end
