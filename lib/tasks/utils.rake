namespace :utils do
  desc "Cria administrdores fake"
  task generate_admins: :environment do

    puts "Criando admins fakes"
        10.times do
            Admin.create!(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                password: "123456",
                password_confirmation: "123456",
                role: [0,1,1,1].sample,
            )
        end
    puts "Admins fakes criado com sucesso!"

  end

end
