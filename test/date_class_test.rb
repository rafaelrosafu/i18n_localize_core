require File.dirname(__FILE__) + '/test_helper'

class DateClassTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end

  def test_date_parse_should_work_well_with_valid_formats
    assert_equal @reference_date, Date.parse(@localized_date_en)
    I18n.locale = :'pt-br'
    assert_equal @reference_date, Date.parse(@localized_date_pt_br)
  end

  def test_date_parse_should_always_work_with_en_formated_dates
    I18n.locale = :'pt-br'
    assert_equal @reference_date, Date.parse(@localized_date_en)
  end

  def test_string_to_date_should_work_well_with_valid_formats
    assert_equal @reference_date, @localized_date_en.to_date
    I18n.locale = :'pt-br'
    assert_equal @reference_date, @localized_date_pt_br.to_date
  end

  def test_string_to_date_should_always_work_with_en_formated_dates
    I18n.locale = :'pt-br'
    assert_equal @reference_date, @localized_date_en.to_date
  end
end
