puts "Clearing old data..."
Audition.destroy_all
Role.destroy_all


puts "Seeding role..."
# Create 10 random roles
10.times do

  Role.create(character_name: Faker::Name.name)
  
end



puts "Seeding auditions..."
# Create 10 random Readers

10.times do
    phone = rand(10..100)
    hired = false
    role_id = Role.ids.sample
  Audition.create(actor: Faker::Name.name, location: Faker::Name.name, phone: phone, hired: hired, role_id: role_id)
end



puts "Done!"