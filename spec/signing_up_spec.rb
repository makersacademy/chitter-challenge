feature 'signing up' do
  scenario 'User can sign up with username, email and password' do

    Peep.create(text: 'Peep peep!', time: Time.now)

    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Peep peep!')
  end
end
