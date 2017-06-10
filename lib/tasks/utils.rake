namespace :utils do
  desc "Cria administrdores fake"
  task generate_admins: :environment do

    puts "Criando admins fakes"
        10.times do
            Admin.create!(
                email: Faker::Internet.email,
                password: "123456",
                password_confirmation: "123456",
            )
        end
    puts "Admins fakes criado com sucesso!"

  end

end
