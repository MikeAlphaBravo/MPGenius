class Seed

  def self.begin
    seed = Seed.new
    seed.generate_users
    seed.generate_vehicles
    see.generate_accounts
    seed.generate_fill_ups
    seed.generate_services
  end

  def generate_users
    User.destroy_all
    30.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        username: Faker::Simpsons.character,
        password: '11111111'
      )
      puts "USER GENORATRON #{user.name}"
    end
  end

  def generate_vehicles
    Vehicle.destroy_all
    20.times do |i|
      vehicle = Vehicle.create!(
        nickname: Faker::Superhero.name,
        year: Faker::Number.between(1950, 2018),
        make: Faker::Vehicle.manufacture,
        model: Faker::Lovecraft.word,
        notes: Faker::Hipster.sentence,
        odometer: Faker::Number.between(0, 250000),
        image: Faker::LoremPixel.image("300x300", false, 'transport')
      )
      puts "BOARDOTRONIC 3000 #{vehicle.nickname}"
    end
  end

  def generate_accounts
    Accounts.destroy_all
    Vehicle.all.each do |i|
      user = User.find(rand(User.first.id..User.last.id))
      accounts = Accounts.create!(
        user_id: user.id,
        vehicle_id: i.id
      )
      puts "KLASPEROOID GENERATION #{accounts.id}"
    end
  end

  def generate_fill_ups
    100.times do |i|
      vehicle = Vehicle.find(rand(Vehicle.first.id..Vehicle.last.id))
      user = vehicle.users.first
      vehicle.fill_ups.create!(
        odometer_reading: Faker::Number.between(0, 250000),
        price_per_gallon: Faker::Number.decimal(2),
        gallons_in_fill: Faker::Number..decimal(2).between(0, 20),
        total_cost: Faker::Number..decimal(2).between(0, 100),
        notes: Faker::Hipster.sentence,
        vehicle_id: vehicle.id
      )
      puts "ROVOTRON 4200 #{vehicle.fill_ups.last.nickname}"
    end
  end

  def generate_services
    20.times do |i|
      vehicle = Vehicle.find(rand(Vehicle.first.id..Vehicle.last.id))
      user = vehicle.users.first
      vehicle.services.create!(
        odometer_reading: Faker::Number.between(0, 250000),
        total_cost: Faker::Number..decimal(2).between(0, 100),
        notes: Faker::Hipster.sentence,
        vehicle_id: vehicle.id
      )
      puts "ROVOTRON 4200 #{vehicle.services.last.nickname}"
  end
end

Seed.begin
