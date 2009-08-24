module I18n
  module I18n_localize_core
    module Numbers
      def self.included(base)
        base.class_eval do
          alias original_to_s to_s
          def to_s(localized = false)
            localized ? I18n.localize_number(self) : original_to_s
          end
        end
      end
    end
  end
end

class Fixnum
  include I18n::I18n_localize_core::Numbers
end
class Bignum
  include I18n::I18n_localize_core::Numbers
end
class Float
  include I18n::I18n_localize_core::Numbers
end
