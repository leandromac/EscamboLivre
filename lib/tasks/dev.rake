namespace :dev do

  desc "Setup Development"
  task setup: :environment do

    images_path = Rails.root.join('public','system')
    puts "Executando o setup do desenvolvimento..."
     puts "Excluindo banco de dados... #{%x(rake db:drop)}"
     puts "Apagando imagens de public/system... #{%x(rm -rf #{images_path})}"
     puts "Criando bando de dados... #{%x(rake db:create)}"
     puts %x(rake db:migrate)
     puts %x(rake db:seed)
     puts %x(rake dev:generate_admins)
     puts %x(rake dev:generate_members)
     puts %x(rake dev:generate_ads)
     puts %x(rake dev:generate_comments)
    puts "Setup realizado com sucesso!"

  end

  desc "Criando ADMINISTRADORES..."
  task generate_admins: :environment do

    puts "Criando ADMINISTRADORES..."
        10.times do
            Admin.create!(
              name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "123456",
              password_confirmation: "123456",
              role: [0,1,1,1].sample,
            )
        end
    puts "ADMINISTRADORES criados com sucesso!"

  end


  desc "Criando MEMBROS..."
  task generate_members: :environment do

    puts "Criando MEMBROS..."
        100.times do
            Member.create!(
              email: Faker::Internet.email,
              password: "123456",
              password_confirmation: "123456",
            )
        end
    puts "MEMBROS criados com sucesso!"

  end


  desc "Criando ANÚNCIOS..."
  task generate_ads: :environment do

    puts "Criando ANÚNCIOS..."
        5.times do
            Ad.create!(
              title: Faker::Lorem.sentence([2,3,4,5].sample),
              description_md: markdown_fake,
              description_short: Faker::Lorem.sentence([2,3].sample),
              member: Member.first,
              category: Category.all.sample,
              finish_date: Date.today + Random.rand(90),
              price: "#{Random.rand(500)},#{Random.rand(99)}",
              picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
            )
        end

        100.times do
            Ad.create!(
              title: Faker::Lorem.sentence([2,3,4,5].sample),
              description_md: markdown_fake,
              description_short: Faker::Lorem.sentence([2,3].sample),
              member: Member.all.sample,
              category: Category.all.sample,
              finish_date: Date.today + Random.rand(90),
              price: "#{Random.rand(500)},#{Random.rand(99)}",
              picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
            )
        end
    puts "ANÚNCIOS criados com sucesso!"

  end

  desc "Criando COMENTÁRIOS..."
  task generate_comments: :environment do

    puts "Criando COMENTÁRIOS..."
      Ad.all.each do |ad|
        (Random.rand(3)).times do
          Comment.create!(
            body: Faker::Lorem.paragraph([1,2,3].sample),
            member: Member.all.sample,
            ad: ad,
          )
        end
      end
    puts "COMENTÁRIOS criados com sucesso!"

  end

  def markdown_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end

end
