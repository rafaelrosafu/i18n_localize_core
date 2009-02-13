require File.dirname(__FILE__) + '/test_helper'

class I18nParseNumberTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end
  
  def test_parse_number_should_return_ArgumentError_unless_receives_string
    assert_raise  ::ArgumentError do
      I18n.parse_number(123)
    end
  end
  
  def test_parse_number_should_return_a_well_formated_float
    I18n.locale = :en
    assert_equal @reference_number, I18n.parse_number(@localized_number_en)
    I18n.locale = :'pt-br'
    assert_equal @reference_number, I18n.parse_number(@localized_number_pt_br)
  end
  
  def test_parse_number_should_return_a_well_formated_float_even_with_localize_core_false
    I18n.localize_core = false
    I18n.locale = :en
    assert_equal @reference_number, I18n.parse_number(@localized_number_en)
    I18n.locale = :'pt-br'
    assert_equal @reference_number, I18n.parse_number(@localized_number_pt_br)
    I18n.localize_core = true
  end
  
  def test_parse_number_should_return_a_bizarre_float_when_receiving_the_wrong_format
    I18n.locale = :en
    assert_equal @bizarre_number, I18n.parse_number(@localized_number_pt_br)
    I18n.locale = :'pt-br'
    assert_equal @bizarre_number, I18n.parse_number(@localized_number_en)
  end
end
