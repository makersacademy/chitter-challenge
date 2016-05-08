feature 'Write peeps' do 

  let(:user) do
    User.create(name: 'Example',
                username: 'example1',
                email: 'user@example.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  scenario 'I can write peeps to Chitter app' do
    sign_in(email: user.email, password: user.password)

    visit '/peeps'

    fill_in :message, with: 'Sinatra is awesome.'
    click_button "Submit"

    expect(page).to have_content "Sinatra is awesome."
  end
  
end