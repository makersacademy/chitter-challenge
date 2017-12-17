feature 'User can sign out' do

  before(:each) do
    User.create(user_name: 'Nikolaos',
                  user_email: 'nikolaos@example.com',
                  password: 'test1234',
                  password_confirmation: 'test1234')
    end

  scenario 'User signs out after signing in and posting a peep' do
    sign_in
    click_button 'Sign out'
    expect(current_path).to eq '/messages'
    expect(page).to have_content('Goodbye! Thank you for using Chitter!')
    expect(page).not_to have_content 'You are signed in as: Nikolaos'
  end

end
