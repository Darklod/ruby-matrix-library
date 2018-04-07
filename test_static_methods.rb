require_relative 'matrix.rb'
include Matrices

puts "\nMatrice Diagonale: "
puts Matrix.diagonal([1, 2, 3])

puts "\nMatrice Identità: "
puts Matrix.unit(3)

puts "\nMatrice Scalare: "
puts Matrix.scalar(3, 7)

puts "\nMatrice Zero: "
puts Matrix.zero(2)

puts "\nMatrice Colonna: "
puts Matrix.column_vector([1, 2, 3])

puts "\nMatrice Riga: "
puts Matrix.row_vector([1, 2, 3])