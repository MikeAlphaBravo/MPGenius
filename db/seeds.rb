class Seed

  def self.begin
    seed = Seed.new
    seed.generate_users
    seed.generate_vehicles
    seed.generate_accounts
    seed.generate_fill_ups
    seed.generate_services
  end

  def generate_users
    User.destroy_all
    5.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        username: Faker::Simpsons.character,
        password: 'password',
        password_confirmation: 'password'
      )
      puts "User Generated #{user.username}"
    end
  end

  def generate_vehicles
    Vehicle.destroy_all
    10.times do |i|
      vehicle = Vehicle.create!(
        nickname: Faker::Superhero.name,
        year: Faker::Number.between(1950, 2018),
        make: Faker::Vehicle.manufacture,
        model: Faker::Lovecraft.word,
        notes: Faker::Hipster.sentence,
        odometer: Faker::Number.between(0, 250000),
        image: Faker::LoremPixel.image("300x300", false, 'transport')
      )
      puts "Vehicle Generated #{vehicle.nickname}"
    end
  end

  def generate_accounts
    Account.destroy_all
    Vehicle.all.each do |i|
      user = User.find(rand(User.first.id..User.last.id))
      accounts = Account.create!(
        user_id: user.id,
        vehicle_id: i.id
      )
      puts "Account Generated #{accounts.id}"
    end
  end

  def generate_fill_ups
    FillUp.destroy_all
    20.times do |i|
      vehicle = Vehicle.find(rand(Vehicle.first.id..Vehicle.last.id))
      user = vehicle.users.first
      # vehicle.fill_ups.create!(
      fill_ups = FillUp.create!(
        odometer_reading: Faker::Number.between(0, 250000),
        price_per_gallon: Faker::Number.decimal(2),
        gallons_in_fill: Faker::Number.decimal(2),
        # .between(0, 20)
        total_cost: Faker::Number.decimal(2),
        # .between(0, 100),
        notes: Faker::Hipster.sentence,
        vehicle_id: vehicle.id
      )
      puts "Fill Ups Generated #{vehicle.fill_ups.last.created_at}"
    end
  end

  def generate_services
    Service.destroy_all
    5.times do |i|
      vehicle = Vehicle.find(rand(Vehicle.first.id..Vehicle.last.id))
      user = vehicle.users.first
      # vehicle.services.create!(
      services = Service.create!(
        service_type: "Oil Change",
        odometer_reading: Faker::Number.between(0, 250000),
        total_cost: Faker::Number.decimal(2),
        # .between(0, 100),
        notes: Faker::Hipster.sentence,
        vehicle_id: vehicle.id
      )
      puts "Services Generated #{vehicle.services.last.created_at}"
    end
  end
end

Seed.begin
