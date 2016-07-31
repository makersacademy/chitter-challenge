feature 'create a peep' do

  before(:each) do
    User.create(name: 'Alice',
                username: 'alice123',
                email: 'alice@example.com',
                password: '12345678',
                password_confirmation: '12345678')
  end

  scenario 'user adds a peep message' do
    visit '/sessions/new'
    fill_in :email, with: 'alice@example.com'
    fill_in :password, with: '12345678'
    click_button 'Sign In'
    fill_in "message", :with => "This is a message"
    click_button('Add Peep')

    within 'ul#peeps' do
      expect(page).to have_content "This is a message"
    end
  end
end
