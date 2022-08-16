#Delete All
puts "Deleting data..."
Pet.destroy_all
Adopter.destroy_all
Shelter.destroy_all

puts "Seeding Data..."


#Shelters

5.times do 
    Shelter.create!(name: Faker::Company.name, address: Faker::Address.street_address)
end

#Adopters

5.times do
    Adopter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

#Pets
5.times do
    Pet.create!(name: Faker::Creature::Dog.name, age: Faker::Number.between(from: 1, to: 15),species: Faker::Creature::Dog.breed, adopted?: false, shelter_id: Shelter.all.pluck(:id).sample, adopter_id: nil)
end

puts "Finished Seeding"