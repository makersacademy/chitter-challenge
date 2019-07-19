# feature 'call on messages to access ID' do
#   scenario 'correctly' do
#     person1 = Person.create(name: 'Person1')
#     person2 = Person.create(name: 'Person2')
#     message1 = Message.create(person_id: person1.id, content: 'Person1 message')
#     message2 = Message.create(person_id: person2.id, content: 'Person2 message')
#
#     person = Person.find_by(name: 'Person1')
#
#     expect(person1.messages).to match_array([
#       have_attribues(content: 'Person1 message')
#     ])
#   end
# end
