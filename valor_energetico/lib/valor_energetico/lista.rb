Node= Struct.new(:value, :next, :prev)

#Lista doblemente enlazada
class Lista
    attr_accessor :inicio, :final, :size
    
    include Enumerable
    
    #Nos permite enumerar la clase Lista
      def each
        i = @final
        f = @size
        k = 0
        while (k < f) do
            yield i.value
            i = i.next
            k = k+1
        end
      end
  
    def initialize()
        @inicio= Node.new(nil,nil,nil)
        @final= Node.new(nil,nil,nil)
        @size = 0
    end
    
    #Inserta un nuevo valor por princio
    def insert_single(valor) #inicio
        nuevo= Node.new(valor,nil,@inicio)
        if (@size < 1)
          @inicio = Node.new(valor, nil,nil)
          @final = @inicio
          @size += 1
        elsif (@size == 1)
          @inicio = nuevo
          @final.next = @inicio
          @inicio.prev = @final
          @size += 1
        elsif (@size > 1)
          ant_inicio = Node.new(@inicio.value,nuevo,@inicio.prev)
          ant_inicio.prev.next = ant_inicio
          @inicio = nuevo
          @inicio.prev.next = @inicio
          @size += 1
        end
    end
    
    #Extrae el nodo de la cabeza
    def extract_beg()
        if(@size==0)
           puts "No hay elementos"
        elsif(@size==1)
           sale = Node.new(@inicio.value,nil,nil)
           @size -= 1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           "#{sale.value}"
        elsif(@size > 1)
           @size -= 1
           sale = Node.new(@inicio.value,nil,nil)
           @inicio.prev.next = nil
           @inicio = @inicio.prev
           "#{sale.value}"
        end
    end
    
    #Extrae el nodo de la cola
    def extract_end()
        if(@size==0)
           puts "No hay elementos"
        elsif(@size == 1)
           sale = Node.new(@final.value,nil,nil)
           @size-=1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           "#{sale.value}"
        elsif(@size > 1)
           @size-=1
           sale = Node.new(@final.value,nil,nil)
           @final.next.prev = nil
           @final = @final.next
           "#{sale.value}"
        end
    end
    
    #Inserta multiples valores en la lista
    def insert_multiple(array)
        array.each do |element|
            insert_single(element)
        end
    end
    
    #Devuelve true si la lista esta vacía
    def empty()
        if(@inicio.value == nil)
            return true
        else
            return false
        end
    end
    
end