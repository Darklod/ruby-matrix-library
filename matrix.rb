module Matrices
    class Matrix

        attr_reader :matrix

        def initialize (*args)
            if (args[0].is_a?(Numeric) && args[1].is_a?(Numeric)) then 
                @rows = args[0]
                @cols = args[1]

                empty(@rows, @cols)
            elsif (args[0].is_a?(Array))
                if (args[1].is_a?(Numeric) && args[2].is_a?(Numeric)) then 
                    list = args[0]
                    @rows = args[1]
                    @cols = args[2]

                    fromList(list, @rows, @cols)
                else 
                    @matrix = args[0]
                    @rows = @matrix.length
                    @cols = @matrix[0].is_a?(Array) ? @matrix[0].length : 0
                end
            else 
                throw "bad args"
            end

            matrix = @matrix
        end

        private def empty (rows, cols)
            @matrix = []
            for r in 0...rows
                @matrix.push([])
                for c in 0...cols
                    @matrix[r].push(0);
                end
            end
            @matrix
        end

        private def fromList (list, rows, cols)
            @rows = rows
            @cols = cols
            @matrix = []

            if (list.length != rows * cols)
                raise "Lista non conforme"
            end

            for row in 0...rows
                @matrix.push([])
                for col in 0...cols
                    @matrix[row].push(list[row * rows + col])
                end
            end
            @matrix
        end

        def randomValues
            @rows.times do |row|
                @cols.times do |col|
                    @matrix[row][col] = rand(0..18) - 9
                end
            end
            @matrix
        end

        def to_s
            string = ""
            @matrix.length.times do |row|
                @matrix[row].length.times do |col| 
                    value = @matrix[row][col].to_s
                    if (@matrix[row][col] >= 0)
                        value = "+" + value
                    end
                    string += " #{value} "
                end
                string += "\n"
            end
            string
        end

        # Properties

        def diagonal?
            @rows.times do |row|
                @cols.times do |col|
                    if row != col && @matrix[row][col] != 0
                        return false
                    end
                end
            end
            true
        end

        def quadratic?
            @rows == @cols
        end

        def empty?
            @rows.times do |row|
                @cols.times do |col|
                    if @matrix[row][col] != 0
                        return false
                    end
                end
            end
            true
        end

        alias :zero? :empty?

        def simmetric?
            if (@rows != @cols) 
                raise "Non è quadrata!" 
            end

            @rows.times do |row|
                @cols.times do |col|
                    if @matrix[row][col] != @matrix[col][row]
                        return false
                    end
                end
            end
            true
        end

        def orthogonal?
            inverse == transpose
        end

        def upper_triangle?
            @rows.times do |row| 
                @cols.times do |col| 
                    if (row < col && @matrix[row][col] != 0) then
                        return false
                    end
                end
            end
            true
        end

        def lower_triangle?
            @rows.times do |row| 
                @cols.times do |col| 
                    if (row > col && @matrix[row][col] != 0) then
                        return false
                    end
                end
            end
            true
        end

        def eql?(other)
            if (@rows != other.matrix.length || @cols != other.matrix[0].length) then
                raise "Non Confrontabili"
            end  

            @rows.times do |row| 
                @cols.times do |col|
                    if (@matrix[row][col] != other.matrix[row][col]) then
                        return false
                    end
                end
            end
            true
        end

        # Methods

        def [](i, j)
            if (!i.between?(0, @rows-1) || !j.between?(0, @cols-1)) then
                raise "out of bounds!"
            else     
                @matrix[i][j]
            end
        end
        
        alias :element []
        alias :component []

        def column(n) 
            mat = []
            @rows.times do |row|
               mat.push([@matrix[row][n]]) 
            end
            Matrix.new(mat)
        end

        def row(n) 
            mat = []
            @cols.times do |col|
                mat.push(@matrix[n][col]) 
            end
            Matrix.new([mat])
        end

        def inverse 
            mat = []
            @rows.times do |row|
                mat.push([])
                @cols.times do |col|
                    if (@matrix[row][col] != 0)
                        mat[row].push(1.0 / @matrix[row][col])
                    else 
                        mat[row].push(0)
                    end
                end
            end
            Matrix.new(mat)
        end

        def transpose
            mat = []
            @rows.times do |row|
                mat.push([])
                @cols.times do |col|
                    mat[row].push(@matrix[col][row])
                end
            end
            Matrix.new(mat)
        end

        def opposite
            mat = []
            @rows.times do |row|
                mat.push([])
                @cols.times do |col|
                    mat[row].push(-@matrix[row][col])
                end
            end
            Matrix.new(mat)
        end

        # Static Methods

        class << self 
            def diagonal (list)
                if (!list.is_a?(Array)) then 
                    raise "non è un array!"
                else 
                    mat = []
                    k = 0
                    for row in 0...list.length
                        mat.push([])
                        for col in 0...list.length
                            if (row == col) then
                                mat[row].push(list[k])
                                k += 1
                            else 
                                mat[row].push(0)
                            end
                        end
                    end
                    Matrix.new(mat)
                end
            end
    
            def zero(n, m = n)
                Matrix.new(n, m)
            end
    
            def identity(n)
                diagonal(Array.new(n, 1))
            end
    
            alias :I :identity
            alias :unit :identity

            def scalar (n, value)
                diagonal(Array.new(n, value))
            end

            def row_vector(list)
                Matrix.new([list])
            end

            def column_vector(list)
                mat = []
                for col in 0...list.length
                    mat.push([list[col]])
                end
                Matrix.new(mat)
            end
        end

        # Operations

        def ==(other)
            @matrix.eql?(other.matrix)
        end

        def +(other)
            mat = []
            @rows.times do |row| 
                mat.push([])
                @cols.times do |col|
                    mat[row].push(@matrix[row][col] + other.matrix[row][col])
                end
            end
            Matrix.new(mat)
        end

        def -(other)
            mat = []
            @rows.times do |row| 
                mat.push([])
                @cols.times do |col|
                    mat[row].push(@matrix[row][col] - other.matrix[row][col])
                end
            end
            Matrix.new(mat)
        end

        def *(other)
            mat = []
            if (other.is_a?(Numeric)) then 
                @rows.times do |row| 
                    mat.push([])
                    @cols.times do |col|
                        mat[row].push(@matrix[row][col] * other)
                    end
                end
            elsif (other.is_a?(Matrix))
                @rows.times do |row| 
                    mat.push([])
                    other.matrix[0].length.times do |col|
                        sum = 0
                        for k in 0...@rows
                            sum += @matrix[row][k] * other.matrix[k][col]
                        end                       
                        mat[row].push(sum)
                    end
                end
            else
                raise "Boh!"
            end
            Matrix.new(mat)
        end

        def /(n)
            if (n == 0) then raise "Divisione per 0!!" end
            mat = []
            @rows.times do |row| 
                mat.push([])
                @cols.times do |col|
                    mat[row].push(@matrix[row][col] / n)
                end
            end
            Matrix.new(mat)
        end

        def **(n)
            mat = []
            @rows.times do |row| 
                mat.push([])
                @cols.times do |col|
                    mat[row].push(@matrix[row][col] ** n)
                end
            end
            Matrix.new(mat)
        end
    end
end
