module I18n
  module I18n_localize_core
    def self.included(base)
      # Special code to override class methods
      base.class_eval do
        class << self
          alias_method :original_reload, :'reload!'
          alias_method :original_locale, :locale=
          
          def reload!
            initialize_separators
            original_reload
          end
          
          def locale=(value)
            initialize_separators
            original_locale(value)
          end
        end
      end
      
      base.extend ClassMethods
    end
    
    module ClassMethods
      def parse_date(target)
        raise ::ArgumentError unless target.is_a? String
        
        if target.length <= 10
          _parse_date(target, [:date, :formats, :default])
        else
          _parse_date(target, [:time, :formats, :long])
        end
      end
      
      def parse_number(target)
        raise ::ArgumentError unless target.is_a? String
        target.to_f true
      end
      
      def localize_core
        @@localize_core ||= false
      end
      
      def localize_core=(value)
        @@localize_core = value
      end
      
      def thousand_separator
        @@thousand_separator ||= I18n.translate(:'number.format.delimiter', :raise => true) rescue nil
      end
      
      def decimal_separator
        @@decimal_separator ||= I18n.translate(:'number.format.separator', :raise => true) rescue nil
      end
      
      # searches for a translation key in the I18n backend
      def lookup_translation(*keys)
        keys.flatten!
        # guarantee the backend initialization
        I18n.translate "_force_initialization_" unless I18n.backend.initialized?
        # access the private variable @translations
        loaded_translations = backend.instance_variable_get '@translations'
        keys.inject(loaded_translations) do |result, k|
          if (x = result[k.to_sym]).nil?
            return {}
          else
            x
          end
        end
      end
      
      protected
        def initialize_separators
          @@thousand_separator = nil
          @@decimal_separator = nil
        end
        
        def _parse_date(target, format_key)
          # search for the format
          format = I18n.lookup_translation(I18n.locale, format_key)
          # continues only if the format is valid
          if (format.is_a? String) and (not format.empty?)
            Date.strptime(target, format) rescue nil
          end
        end
    end
  end
end
