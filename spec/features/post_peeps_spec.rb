require 'helpers/sessions'

feature "Posting peeps" do

  let(:user) do
    User.create(full_name: "Fred Bloggs",
                  user_name: "fredb",
                  email: "fred@bloggs.com",
                  password: "ABC123",
                  password_confirmation: "ABC123")
  end

  scenario 'A signed in user can post a new peep' do
    sign_in(user_name: user.user_name, password: user.password)
    click_button 'Write peep'
    expect(current_path).to eq '/peeps/new'
    fill_in :message, with: "Hi! This is my first peep!"
    click_button 'Send peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content("Hi! This is my first peep!")
    end
  end
end
