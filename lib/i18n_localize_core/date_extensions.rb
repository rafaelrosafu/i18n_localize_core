class Date
  class << self
    alias original_parse _parse
    def _parse(str, comp=false)
      #use original_parse only if the date is in yyyy-mm-dd format
      if !I18n.localized_core? || str.match(/\d{4}-\d{2}-\d{2}/)
        original_parse(str, comp)
      else
        p = I18n.parse_date str
        #returns a hash with year, month and day, as original parse does
        {:year => p.year, :mday => p.mday, :mon => p.mon} unless p.nil?
      end
    end
  end
end
