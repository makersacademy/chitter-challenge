feature 'Creating peeps' do
  include Helpers

  scenario 'create a new peep' do
    visit '/users/new'
    save_and_open_page
    fill_in :email, with: "dave@me.com"
    fill_in :username, with: "dave"
    fill_in :password, with: "password123"
    fill_in :password_confirmation, with: "password123"
    click_button 'Sign up'
    fill_in "message", with: 'This is the first peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page). to have_content('This is the first peep')
    end
  end

end
