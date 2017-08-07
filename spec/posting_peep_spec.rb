
feature 'posting peeps' do
  scenario 'I can add new peeps' do
    User.create(email: 'nandy5@email.com', password:'nan123')
    visit '/log_in'
    fill_in :email, with:'nandy5@email.com'
    fill_in :password, with:'nan123'
    click_button 'submit'
    expect(page).to have_content "Welcome, nandy5@email.com"
    visit '/peeps/new'
    fill_in :peep, with: "Hello, my first peep"
    click_button 'submit'
    expect(page).to have_content("Hello, my first peep")
    end
  end
