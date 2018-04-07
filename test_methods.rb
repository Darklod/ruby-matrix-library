require_relative "matrix.rb"
include Matrices

matrixA = Matrix.new(2, 2)
matrixA.randomValues()
puts "Matrice A:"; puts matrixA

puts "\nOpposta di A:"; puts matrixA.opposite
puts "\nInversa di A:"; puts matrixA.inverse
puts "\nTrasposta di A:"; puts matrixA.transpose

matrixB = Matrix.new([2, 4, 4, 2], 2, 2)
puts "\nMatrice B:"; puts matrixB

puts "\nElementi di B: "
print "(0,0): "; puts matrixB[0, 0]
print "(1,0): "; puts matrixB.component(1, 0)
print "(1,1): "; puts matrixB.element(1, 1)

puts "\n Colonna 2 di B: "; puts matrixB.column(1)
puts "\n Riga 1 di A: "; puts matrixA.row(0)   
