# require './spec/factories/peep'

# feature 'viewing peeps' do
#   scenario 'can view peeps including content, time, username and name' do
#     user = User.create(username: 'jk', name: 'John Kennedy')
#     user.create_peep 'Hi!'
#     # peep = Peep.create(content: 'Hi!', time: Time.now)
#     visit '/peeps'
#     expect(page.status_code).to eq 200
#     expect(page).to have_content 'Hi!'
#     expect(page).to have_content peep.time
#     expect(page).to have_content peep.username
#     expect(page).to have_content peep.name
#   end

  # scenario 'can view peeps in reverse chronological order' do
  #   peep1 = Peep.create(content: 'Hi!')
  #   peep2 = Peep.create(content: 'Bye!')
  #   visit '/peeps'
  #   within '#peep1' do
  #     expect(page).to have_content peep2.content
  #   end
  # end
# end
