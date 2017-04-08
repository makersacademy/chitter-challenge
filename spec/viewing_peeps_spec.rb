feature 'viewing peeps' do
  scenario 'User can view peeps' do

    Peep.create(text: 'Peep peep!', time: Time.now)

    sign_in
    expect(page.status_code).to eq 200
    expect(page).to have_content('Peep peep!')
  end
end
