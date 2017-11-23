#Esta clase nos permite almacenar alimentos y calcular su IG
class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
    include Comparable
 
    #Nos permite comparar objetos de Energia
    def <=>(other) 
        @proteinas <=> other.proteinas
    end

    
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
    
    #Calcula y devuelve el valor energetico
    def get_valor_energetico

        return ((@proteinas + @glucidos) * 4 + @lipidos * 9).round(1)

    end
    
    def indice_glucemico(alimento, glucosa)
       
       indice =[],[]
       al = []
       gl = []
       alimento.each_with_index do |val, index|
           alimento[index].each_with_index{|val,index2| indice[index] << index2 }
       end
       
       indice.each_with_index do |valor,i| #quitamos el valor 0 del indice.
         indice[i] = valor.select{|val| val > 0}
       end
        
       al = [],[]
       gl = [],[]
       alsum = [],[]
       glsum = [],[]
       r = [],[]
       s = [],[]
       
       indice.each_with_index do |val, index|
         val.collect do |index2|
            al[index] << ((alimento[index][index2] - alimento[index][0]) + (alimento[index][index2-1] - alimento[index][0]))*2.5
            gl[index] << ((glucosa[index][index2] - glucosa[index][0]) + (glucosa[index][index2-1] - glucosa[index][0]))*2.5
        end
            alsum[index] = al[index].reduce(:+)
            glsum[index] = gl[index].reduce(:+)
        
       end
       
       r = alsum.zip(glsum)
       
       alsum.each_with_index{|val,index| s[index] = r[index].reduce(:/)*100}
       @indice_glucemico = s.reduce(:+)/2
        
    end
    
end



#Clase hija de Energia, contiene un objeto Energia y el nombre de un grupo de alimentos
class Grupo_alimentos < Energia

  
    def initialize(a,b,c,d,e)
        super(a,b,c,d)
        @nombre_grupo = e
    end
    
    def to_s
    
        
    end
    
end

