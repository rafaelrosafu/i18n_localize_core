require File.dirname(__FILE__) + '/test_helper'

class StringClassToFTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end

  def test_string_to_f_should_return_a_well_formated_float_when_parameter_true
    #I18n.localize_core = false
    assert_equal @reference_number, @localized_number_en.to_f(true)
    I18n.locale = :'pt-br'
    assert_equal @reference_number, @localized_number_pt_br.to_f(true)
  end

  def test_string_to_f_should_return_a_bizarre_float_when_receiving_the_wrong_format
    assert_equal @bizarre_number, @localized_number_pt_br.to_f(true)
    I18n.locale = :'pt-br'
    assert_equal @bizarre_number, @localized_number_en.to_f(true)
  end

  def test_string_to_f_should_return_a_well_ruby_formated_float_when_parameter_false_and_format_en
    assert_equal @reference_number_ruby, @localized_number_en.to_f(false)
  end

  def test_string_to_f_should_return_a_bizarre_ruby_formated_float_when_parameter_false_and_format_not_en
    I18n.locale = :'pt-br'
    assert_equal @bizarre_number_ruby, @localized_number_pt_br.to_f(false)
  end
end
