require './spec/features/login'
feature 'Viewing peeps' do
  include Login

  before(:each) do
    User.create(username: 'faisal',
                email: 'faisal@gmail.com',
                password: 'burgerking',
                password_confirmation: 'burgerking')
  end

  scenario 'I can see existing peeps' do
    sign_in(email: 'faisal@gmail.com', password: 'burgerking')
    visit '/peep/new'
    fill_in :peep, with: "Let's have some burgerking"
    click_button 'peep'
    within 'ul#peeps' do
      expect(page).to have_content("Let's have some burgerking")
    end
  end
end
