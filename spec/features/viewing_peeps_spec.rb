require_relative '../../app/app.rb'
require_relative '../../app/models/peep.rb'

feature 'viewing peeps' do

  scenario 'homepage has list of peeps' do
    Peep.create(content: 'Hello World')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello World')
    end
  end

  # scenario 'peeps are in reverse chronological order' do
  # end
  
  scenario 'peeps have a date and time' do
    visit '/peeps'
    click_button("Write peep")
    fill_in('name', with: "Olivia")
    fill_in('email', with: "o@makers.com")
    fill_in('username', with: "frosty")
    fill_in('password', with: "olivia")
    expect(User).to receive(:create).with(name: 'Olivia', username: 'frosty', email: 'o@makers.com', password: 'olivia')
    click_button("Complete Signup")
    fill_in('my_peep', with: 'Hello World')
    click_button("Peep")
    visit '/peeps'
    expect(page).to have_text(peep.created_at)
  end
  
  
end