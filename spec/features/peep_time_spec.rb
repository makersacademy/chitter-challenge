# User story 3
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# feature 'Display peep time when posted' do
#   scenario 'User sees the peeps with time when they were posted' do
#     peep = Peep.create(peep: "My first peep")
#     time = Peep.display[0].timestamp
#     visit ('/')
#     expect(page).to have_content(time.strftime('%F %H:%M%P'))
#     # Time.now - Time.parse(peep.timestamp) 
#   end
# end

feature 'Display 
peep time when posted' do
  scenario 'User sees the peeps with time when they were posted' do
    peep = Peep.create(peep: "My first peep")
    visit ('/')
    expect(peep.timestamp).to have_content Time.now.to_s
    # Time.now - Time.parse(peep.timestamp) 
  end
end