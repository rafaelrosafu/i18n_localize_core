module I18n
  class << self
    def parse_date(target)
      raise ArgumentError unless target.is_a? String
      
      if target.length <= 10
        _parse_date(target, [:date, :formats, :default])
      else
        _parse_date(target, [:time, :formats, :long])
      end
    end
    
    def parse_number(target)
      raise ArgumentError unless target.is_a? String
      target.to_f true
    end
    
    def localize_core
      (@@localize_core ||= false) == true
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
    
    alias original_reload reload!
    def reload!
      initialize_separators
      original_reload
    end
    
    alias original_locale locale=
    def locale=(value)
      initialize_separators
      original_locale(value)
    end
    
    protected
      def initialize_separators
        @@thousand_separator = nil
        @@decimal_separator = nil
      end
      
      # Busca um chave de tradução dentro do backend do I18n
      def lookup_translation(keys)
        # Garante a initialização do backend
        I18n.translate "_force_initialization_" unless I18n.backend.initialized?
        # Acessa a variável @translations usando instance_eval, já que ela não
        # possui accessor público
        loaded_translations = backend.instance_eval '@translations'
        keys.inject(loaded_translations) do |result, k|
          if (x = result[k.to_sym]).nil?
            return {}
          else
            x
          end
        end
      end
      
      def _parse_date(target, format_key)
        # Busca o formato de tradução no backend
        format = I18n.lookup_translation([I18n.locale] + format_key)
        result = nil
        # Só continua se achou um formato válido
        if (format.is_a? String) and (not format.empty?) then
          begin
            result = Date.strptime(target, format)
          rescue
          end
        end
        result
      end
  end
end
