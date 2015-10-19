# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

('a'..'d').each do |letter|
  User.create!(username: letter)
end

User.all.each do |user|
  2.times do |i|
    user.contacts.create!(email: "person#{i}@#{user.username}.me",
                         name: "person#{i}")
  end
end

Contact.all.each do |contact|
  contact.contact_shares.create!(user_id: rand(4))
end

User.last.comments.create!(
  commentable_id: 1,
  commentable_type: 'User',
  text: "this user is the bomb"
)
