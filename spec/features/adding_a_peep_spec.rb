require_relative '../helper_methods.rb'
feature 'adding peeps' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345',
                name: 'test_name',
                username: 'user_numero_uno')
  end

  scenario 'is not possible when logged out' do
    peep
    expect(current_path).to eq '/'
    expect(page).not_to have_content('new peep!')
    expect(page).to have_content('you need to log in to make a peep')
  end

  scenario 'is possible when logged in' do
    sign_in
    peep
    expect(page).to have_content('new peep!')
  end

  scenario 'creates a peep with the users name attached' do
    sign_in
    peep
    expect(page).to have_css('.peeplist', text: 'user_numero_uno')
  end

end

def peep content = 'new peep!'
  visit '/peeps/new'
  fill_in :peep, with: content
  click_button 'peep'
end
