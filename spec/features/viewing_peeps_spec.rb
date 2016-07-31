# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing the timeline of Peeps' do

  let(:user) do
    User.create(name: 'luke',
                email: 'luke@luke.com',
                password: 'abc123',
                password_confirmation: 'abc123')
  end

  scenario 'as a user I can view a timeline of existing messages' do
    sign_in(username: user.username, password: user.password)
    user.peeps.create(message: "This is my first peep. Hello World!")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("This is my first peep. Hello World!")
    end
  end
end
