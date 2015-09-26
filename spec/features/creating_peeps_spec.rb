feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page). to have_content('My first peep')
    end
  end

  scenario 'there are no links in the database at the start of the test' do
  expect(Peep.count).to eq 0
end

scenario 'requires a matching confirmation password' do
  # again it's questionable whether we should be testing the model at this
  # level.  We are mixing integration tests with feature tests.
  # However, it's convenient for our purposes.
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
end

  def sign_up(email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end




end
