feature 'User sign in' do

  let!(:maker) do
    Maker.create(name: 'Zara',
                username: 'Zara02',
                email: 'maker@example.com',
                password: 'yorkshire1234',
                password_confirmation: 'yorkshire1234')
  end

  scenario 'with correct credentials' do
    sign_in(name: maker.name, username: maker.username, email: maker.email, password: maker.password)
    expect(page).to have_content "Welcome, #{maker.username}"
  end

  feature 'User signs out' do

  before(:each) do
    Maker.create(name: 'Zara',
                username: 'Zara02',
                email: 'maker@example.com',
                password: 'yorkshire1234',
                password_confirmation: 'yorkshire1234')
  end

  scenario 'while being signed in' do
    sign_in(name: 'Zara', username:'Zara02', email:'maker@example.com', password:'yorkshire1234')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Zara02')
  end
  end
end
