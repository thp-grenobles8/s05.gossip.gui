# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'deleting database...'
PrivateMessage.destroy_all
Like.destroy_all
JoinTagGossip.destroy_all
Tag.destroy_all
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
puts '...database DELETED'

puts 'CITIES ------------'
10.times {
  c = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
  puts "-city of #{c.name} created"
}

puts 'USERS -------------'
10.times {
  u = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.famous_last_words,
    email: Faker::Internet.email,
    age: rand(1..90),
    city: City.all.sample,
    password: "password"
  )
  puts "-user #{u.first_name} created"
}

puts 'GOSSIPS --------------'
20.times {
  g = Gossip.create!(
    title: Faker::Cannabis.buzzword,
    content: Faker::Quote.famous_last_words,
    author: User.all.sample
  )
  puts "#{g.author.first_name} posted #{g.title}"
}

puts 'TAGS & join tags gossips --------'
10.times {
  t = Tag.create!(
    title: '#' + Faker::Cannabis.buzzword
  )
}
Gossip.all.each {
  |g| # pour chaque potin
  rand(1..5).times { # jusqu'a 5 tags
    t = Tag.all.sample # un tag au hasard
    if !g.tags.include?(t) # si le tag n'est pas déjà associé au gossip
      j = JoinTagGossip.create!(
        gossip: g,
        tag: t
      )
      puts "tag #{t.title} added to gossip #{g.title}"
    end
  }
}

puts 'LIKES -----------------------'
User.all.each {
  |u|
  8.times {
    g = Gossip.all.sample
    if !u.liked_gossips.include?(g)
      l = Like.create!(
        gossip: g,
        user: u
      )
      puts "#{u.first_name} liked #{g.title}"
    end
  }
}

puts 'PRIVATE MESSAGES ------------'
20.times {
  sender = User.all.sample
  recipient = User.all.select{|u| u != sender}.sample
  # le message ne peut pas être envoyé et recu par la même personne
  # en vérité si, mais bon on c'est plus marrant comme ça
  pm = PrivateMessage.create!(
    content: Faker::Lorem.sentence(20),
    sender: sender,
    recipient: recipient
  )
  puts "#{pm.sender.first_name} a envoyé un message à #{pm.recipient.first_name}"
}

puts 'COMMENTS --------------------'
40.times {
  coms_text = ['LOL', 'XPTdR', 'génial', 'je plussoie',
  'XD jador t ki ?', "c'est pas ouf quoi", '+1', 'first']
  com = Comment.create!(
    content: coms_text.sample,
    author: User.all.sample,
    gossip: Gossip.all.sample
  )
  puts "#{com.author.first_name} a commenté un gossip avec #{com.content}"
}
