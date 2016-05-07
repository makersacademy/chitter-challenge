feature 'Viewing peeps' do

  scenario 'user can see existing peeps on the peeps page' do
    Peep.create(content: 'This is the first peep!', time: Time.now)

    visit '/peeps'

    expect(page.status_code).to eq 200
    expect(page).to have_content('This is the first peep!')

  end
end