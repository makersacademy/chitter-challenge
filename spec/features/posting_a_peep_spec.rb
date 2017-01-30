# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature "posting peeps" do
  scenario "so I know I need to log in to post peeps" do
    visit('/')
    expect(page).to have_content('Please sign up or sign in to start peeping')
  end
  scenario 'so I can post a peep when signed in' do
    sign_in
    create_peep
    expect(page).to have_content('m1k3: This is my first peep')
  end
  scenario 'so my peep counts increase' do
    sign_in
    expect{create_peep}.to change{Peep.count}.by(1)
  end
end
