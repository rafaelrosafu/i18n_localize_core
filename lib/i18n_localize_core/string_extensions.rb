class String
  def as_delocalized_number
    # Using dup to avoid problems with frozen strings
    result = self.dup
    result.gsub!(I18n.thousand_separator, '_') if I18n.thousand_separator
    result.gsub!(I18n.decimal_separator, '.') if I18n.decimal_separator
    result
  end

  alias original_to_f to_f
  def to_f(localized = false)
    (localized ? as_delocalized_number : self).original_to_f
  end

  alias original_to_i to_i
  def to_i(base_or_localized = false, localized = false)
    if base_or_localized.is_a?(Integer)
      base =  base_or_localized
    else
      base = 10
      localized = base_or_localized
    end
    (localized ? as_delocalized_number : self).original_to_i(base)
  end
end
