# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Criando categorias padrão..."
categories = [
    "Animais e Acessórios",
    "Esportes",
    "Para a sua casa",
    "Eletrônicos e celulares",
    "Música e hobbies",
    "Bebês e crianças",
    "Moda e beleza",
    "Veículos e barcos",
    "Imóveis",
    "Emprego e negócios",
]
puts "Categorias criadas com sucesso!"

categories.each do |category|
    Category.find_or_create_by!(description: category)
end