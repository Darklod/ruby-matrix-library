require_relative 'matrix.rb'
include Matrices

matrixA = Matrix.new([1, 2, 3, 4], 2, 2)
matrixB = Matrix.new([3, 5, 2, 9], 2, 2)

puts "Matrice A: "; puts matrixA
puts "\nMatrice B: "; puts matrixB

print "\nSomma (A + B): \n"; puts matrixA + matrixB
print "\nDifferenza (B - A): \n"; puts matrixB - matrixA
print "\nProdotto per un numero (A * 15): \n"; puts matrixA * 15
print "\nProdotto matriciale (A * B): \n"; puts matrixA * matrixB
print "\nDivisione per un numero (A/3): \n"; puts matrixA / 3
puts "\nEsponenziale (B^2): "; puts matrixB ** 2
puts "\nSono uguali (A=B): " + (matrixA == matrixB ? "Sì" : "No")