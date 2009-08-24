require File.dirname(__FILE__) + '/test_helper'

class StringClassToITest < Test::Unit::TestCase
  def setup
    setup_I18n
  end

  def test_string_to_i_should_return_a_well_formated_integer_when_parameter_true
    I18n.localize_core = false
    assert_equal @reference_integer, @localized_number_en.to_i(true)
    I18n.locale = :'pt-br'
    assert_equal @reference_integer, @localized_number_pt_br.to_i(true)
  end

  def test_string_to_i_should_return_a_bizarre_integer_when_receiving_the_wrong_format
    assert_equal @bizarre_integer, @localized_number_pt_br.to_i
    I18n.locale = :'pt-br'
    assert_equal @bizarre_integer, @localized_number_en.to_i
  end

  def test_string_to_i_should_return_a_well_ruby_formated_integer_when_parameter_false_and_format_en
    assert_equal @reference_integer_ruby, @localized_number_en.to_i(false)
  end

  def test_string_to_i_should_return_a_bizarre_ruby_formated_integer_when_parameter_false_and_format_not_en
    I18n.locale = :'pt-br'
    assert_equal @bizarre_integer_ruby, @localized_number_pt_br.to_i(false)
  end
end
