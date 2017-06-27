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
    Category.friendly.find_or_create_by!(description: category)
end

puts "Cadastrando ADMIN padrão..."
Admin.create!(
    name: "Leandro Macedo",
    email: "contato@leandromacedo.com",
    password: "lfm0607",
    password_confirmation: "lfm0607",
    role: 0,
    )
puts "ADMIN padrão cadastrado com sucesso!"

puts "Cadastrando MEMBRO padrão..."
member = Member.new(
    email: "membro@membro.com",
    password: "lfm0607",
    password_confirmation: "lfm0607",
    )
    member.build_profile_member

    member.profile_member.first_name = Faker::Name.first_name
    member.profile_member.second_name = Faker::Name.last_name

    member.save!
puts "MEMBRO padrão cadastrado com sucesso!"
