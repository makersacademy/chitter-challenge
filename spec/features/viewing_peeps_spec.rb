feature 'Viewing peeps' do

  before do
    sign_up
  end

  scenario 'users can see list of peeps on their homepage' do
    Peep.create(message: 'Hi and welcome to Chitter')

    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Hi and welcome to Chitter'

  end
end
