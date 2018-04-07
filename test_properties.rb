require_relative 'matrix.rb'
include Matrices

matrixA = Matrix.new(3, 3)
matrixA.randomValues()
print "Matrice A: \n"; print matrixA

puts
puts "Quadrata:   " + (matrixA.quadratic? ? "Sì" : "No")
puts "Diagonale:  " + (matrixA.diagonal? ? "Sì" : "No")
if (matrixA.quadratic?)
    puts "Simmetrica: " + (matrixA.simmetric? ? "Sì" : "No")
end
puts "Nulla:      " + (matrixA.empty? ? "Sì" : "No")

puts "\nMatrice B:"
matrixB = Matrix.new([1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0 ,1], 4, 4)
puts "Ortogonale:" + (matrixB.orthogonal? ? "Sì" : "No")

puts "\nMatrice C:"
matrixC = Matrix.new([0, 0, 0 , 0, 1, 0, 3, 4, 4], 3, 3)
puts matrixC

puts "\nUguaglianza (A=C): " + (matrixA.eql?(matrixC) ? "Sì" : "No")

puts "\nMatrice Triangolare Inferiore: " + (matrixC.lower_triangle? ? "Sì" : "No")
puts "Matrice Triangolare Superiore: " + (matrixC.upper_triangle? ? "Sì" : "No")