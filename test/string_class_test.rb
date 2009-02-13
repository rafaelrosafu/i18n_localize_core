require File.dirname(__FILE__) + '/test_helper'

class StringClassTest < Test::Unit::TestCase
  def setup
    setup_I18n
  end
  
  def test_as_delocalized_number
    assert_equal @delocalized_number, @localized_number_en.as_delocalized_number
    I18n.locale = :'pt-br'
    assert_equal @delocalized_number, @localized_number_pt_br.as_delocalized_number
  end
end
