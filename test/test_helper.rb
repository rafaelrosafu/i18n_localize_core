require 'rubygems'
require 'test/unit'
#require 'shoulda'
require 'mocha'
require 'activesupport'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'lib/i18n_localize_core'

class Test::Unit::TestCase
  def setup_I18n
    I18n.backend.store_translations :en, {  :date => {
                                              :formats => {
                                                :default => "%Y-%m-%d"
                                              }
                                            },
                                            :number => {
                                              :format => {
                                                :delimiter => ',',
                                                :separator => '.'
                                              }
                                            },
                                            :test_lookup => 'lookup works'
                                          }
    I18n.backend.store_translations :'pt-br', {
                                                :date => {
                                                  :formats => {
                                                    :default => "%d/%m/%Y"
                                                  }
                                                },
                                                :number => {
                                                  :format => {
                                                    :delimiter => '.',
                                                    :separator => ','
                                                  }
                                                }
                                              }
    @reference_date = Date.civil(2009, 02, 20)
    @localized_date_en = "2009-02-20"
    @localized_date_pt_br = "20/02/2009"

    @reference_number = 876_543.21
    @reference_number_ruby = 876.0

    @reference_integer = 876_543
    @reference_integer_ruby = 876

    @bizarre_integer = 876
    @bizarre_integer_ruby = 876

    @bizarre_number = 876.54321
    @bizarre_number_ruby = 876.543

    @localized_number_en = "876,543.21"
    @localized_number_pt_br = "876.543,21"

    @delocalized_number = "876_543.21"

    I18n.locale = :en
    I18n.localize_core = true
  end
end
