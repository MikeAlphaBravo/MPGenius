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
      puts "BOARDOTRONIC 3000 #{vehicle.title}"
    end
  end

  def generate_board_users
    BoardUser.destroy_all
    Board.all.each do |i|
      user = User.find(rand(User.first.id..User.last.id))
      board_user = BoardUser.create!(
        user_id: user.id,
        board_id: i.id
      )
      puts "KLASPEROOID GENERATION #{board_user.id}"
    end
  end

  def generate_mezzages
    100.times do |i|
      board = Board.find(rand(Board.first.id..Board.last.id))
      user = board.users.first
      board.mezzages.create!(
        title: Faker::Simpsons.location,
        body: Faker::RickAndMorty.quote,
        user_id: user.id
      )
      puts "ROVOTRON 4200 #{board.mezzages.last.title}"
    end
  end
end

Seed.begin
