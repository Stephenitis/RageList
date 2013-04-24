require 'faker'

100.times do
name = Faker::Lorem.word
  Category.create({name: name})
end

