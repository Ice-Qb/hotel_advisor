namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@user.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    35.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@user.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 5)

    n = 0
    
    7.times do 
      users.each do |user|
        title         = "Title ##{n}"
        #star_rating   = 1 + rand(4) + rand.round(2)
        description   = Faker::Lorem.sentence(10)
        breakfast     = [true, false].sample
        price         = rand(1000) + rand.round(2)

        nation = "Country ##{n}"
        state  = "State ##{n}"
        city   = "City ##{n}"
        street = "Street ##{n}"

        hotel = user.hotels.create!(
          title: title, breakfast: breakfast, 
          description: description, price: price)

        address = Address.create!(nation: nation, state: state,
          city: city, street: street, hotel_id: hotel.id)

        n += 1
      end
    end

    users.each do |user|
      user.hotels.each do |hotel|
        5.times do
          value   = 1 + rand(4) + rand.round(2)
          comment = Faker::Lorem.sentence(7)
          hotel.ratings.create!(value: value, comment: comment)
        end

        ratings = hotel.ratings
        
        if ratings.count != 0
          star_rating = (ratings.map(&:value).sum.to_f / ratings.count).round(2)
        else
          star_rating = 1.00
        end 

        hotel.update_attribute(:star_rating, star_rating)
      end
    end
  end
end