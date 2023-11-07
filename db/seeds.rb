# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

EventUser.destroy_all
Event.destroy_all
User.destroy_all

first = true
10.times do
  if first
    10.times do
      user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        sell_site_token: SecureRandom.alphanumeric,
      )
      user.save!
    end
  end
  hour = rand(17..21)
  day = rand(2..27)
  month = rand(1..12)
  year = rand(2023..2024)
  start_datetime = DateTime.new(year, month, day,hour,0)
  end_datetime = DateTime.new(year, month, day,hour + 1,0)
  type_event = 'Special Events'
  if first
    type_event = 'Regular Events'
    first = false
  end
  event = Event.new(
    name: Faker::Movie.title,
    description: Faker::Movie.quote,
    start_datetime: start_datetime, 
    end_datetime: end_datetime,
    price: rand(0..20),
    type_event: type_event,
    cover_image: Faker::LoremFlickr.image,
    image: [Faker::LoremFlickr.image, Faker::LoremFlickr.image],
    registration_start_datetime: DateTime.new(year, month, 1,hour,0),
    registration_end_datetime: DateTime.new(year, month, 28,23,59),
    sell_site_number: SecureRandom.alphanumeric,
  )
  event.save!
  5.times do
    event_user = EventUser.new(
      user_id: User.order('RANDOM()').limit(1)[0].id,
      event_id: event.id,
      relation_type: ['booked', 'wish'].sample
    )
    event_user.save!
  end
end

Site.destroy_all

site = Site.new(
  title: "Brazilian forro classes & events in the heart of Liverpool",
  description: "Beginner-friendly, Roots-style forro dance classes and live music events in the heart of Liverpool. No partner needed. Come try a free intro class!",
  long_description: "Dance classes, live music events, and Brazilian cultural events in Liverpool, England. Teachers from recife teach a mix of styles (pe de serra, universitario, with a roots focus) to all-levels students. We regularly host guest teachers like Luiz Henrique, Mardio Costa & Milena Morais, and Lucas Dumont.",
  cover_image: "https://www.otempo.com.br/image/contentid/policy:1.2638617:1647968748/Screen-Shot-2022-03-22-at-2-01-35-PM-png.png?f=3x2&q=0.6&w=1200&$p$f$q$w=ceb5660",
  cover_video: "https://www.gov.br/pt-br/midias-agorabrasil/video-fundo.mp4",
  image: [Faker::LoremFlickr.image, Faker::LoremFlickr.image]
)
site.save!

Question.destroy_all
5.times do
  question = Question.new(
    question: Faker::Movie.title,
    answer: Faker::Movie.quote
  )
  question.save!
end

Community.destroy_all
community = Community.new(
  profile_image: ['https://avatars.githubusercontent.com/u/85016706?v=4','https://avatars.githubusercontent.com/u/85016706?v=4'],
  name: ['Felipe Braga', 'Marina Cerqueira'],
  profile: "Profiles on Felipe & Marina including how long they have been dancing, where they trained, maybe why they dance forro",
  description: "Something about the comunnity of forrozeiros, that they come from all over, many speak/don't speak Portuguese, etc. Emphasize grassroots, collaborative approach"
)
community.save!
