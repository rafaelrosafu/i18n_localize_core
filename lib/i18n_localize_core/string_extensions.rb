class String
  def as_delocalized_number
    result = self.clone
    result.gsub!(I18n.thousand_separator, '_') if I18n.thousand_separator
    result.gsub!(I18n.decimal_separator, '.') if I18n.decimal_separator
    result
  end
  
  alias original_to_f to_f
  def to_f(localize = nil)
    localize = I18n.localize_core if localize.nil?
    (localize ? as_delocalized_number : self).original_to_f
  end
  
  alias original_to_i to_i
  def to_i(localize = nil)
    localize = I18n.localize_core if localize.nil?
    (localize ? as_delocalized_number : self).original_to_i
  end
end
