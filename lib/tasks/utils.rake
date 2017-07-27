namespace :utils do
  desc "Cria administradores fake"
  task generate_admins: :environment do
    puts "Cadastrando ADMINISTRADORES..."

    10.times do
      Admin.create!(email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456")
      
    end
  end

  puts "ADMINISTRADORES cadastrados com sucesso!"
end
