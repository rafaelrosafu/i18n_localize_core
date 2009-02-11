class Date
  class << self
    alias original_parse _parse
    def _parse(str, comp=false)
      result = original_parse(str, comp)
      
      if I18n.localize_core then
        #Se retornou um hash vazio, é porque não conseguiu fazer o parse original
        do_parse_i18n = (result == {})
        
        #Se retornou algo, tenta criar uma data válida com o valor
        unless do_parse_i18n then
          begin
            #Se o original_parse retornar algo, será um hash com ano, mês e dia
            d = Date.civil(result[:year], result[:mon], result[:mday])
          rescue ArgumentError
            #Se não for possível gerar a data, deve fazer o parse do I18n
            do_parse_i18n = true
          end
        end
        
        if do_parse_i18n then
          p = I18n.parse_date str
          #Retorna um hash com ano, mês e dia, como o original
          result = {:year => p.year, :mday => p.mday, :mon => p.mon} unless p.nil?
        end
      end
      
      result
    end
  end
end
