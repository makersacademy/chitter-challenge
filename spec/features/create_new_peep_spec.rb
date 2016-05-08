feature "User can create a new peep" do

  let(:user) do
    User.create(name: 'Bob',
                username: 'bobross',
                email: 'bob@ross.com',
                password: 'bobross',
                password_confirmation: 'bobross')
  end

  scenario 'send a peep when signed in with time and date' do
    login(username: user.username,   password: user.password)
    click_button "New Peep!"
    fill_in :message, with: 'stuff'
    click_button "Peep it!"
    time = Time.now.strftime('%H:%M %d/%m/%Y')
    expect(page).to have_content "bobross peeped:- stuff at #{time}"
  end

  scenario 'redirects to login page if not logged in a clicks New peep' do
    visit '/'
    click_button "New Peep!"
    expect(current_path).to eq '/sessions/new'
  end

end
