class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
    def initialize(a,b,c,d)
       
        @alimento, @proteinas, @glucidos, @lipidos, @valor_ener = a, b, c, d, []
    end

    def to_s

        out = "\t\t   Proteínas\tGlúcidos\tLípidos\n"
            out << @alimento
            out << "\t\t"
            out << @proteinas.to_s
            out << "\t\t"
            out << @glucidos.to_s
            out << "\t\t"
            out << @lipidos.to_s
            out << "\n"
       
        out
  
        
    end
    
    def get_nombre
        
        out = "#{@alimento}"
        out        
    end

    def get_proteinas

        #out = "#{@proteinas}"
        #out  
        
        return @proteinas
    end
    
    def get_glucidos

        return @glucidos 
    end

    def get_lipidos

     return @lipidos
     
    end
    
    def get_valor_energetico

        
        
        
            
            return ((@proteinas + @glucidos) * 4 + @lipidos * 9).round(1)
           
              
    end
   
end

