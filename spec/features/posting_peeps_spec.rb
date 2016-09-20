# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting Peeps to the timeline' do

  let(:user) do
    User.create(name: 'luke',
                username: 'luke',
                email: 'luke@luke.com',
                password: 'abc123',
                password_confirmation: 'abc123')
  end

  scenario 'a logged in user can post a peep' do
    sign_in(username: user.username, password: user.password)
    click_button 'Send Peep'
    expect(page.status_code).to eq 200
    fill_in 'message', with: "Hello World! This is my first Peep!"
    click_button 'Send Peep'
    expect(current_path).to eq '/peeps'
    within 'ul.peeps' do
      expect(page).to have_content "Hello World! This is my first Peep!"
    end
  end
end
