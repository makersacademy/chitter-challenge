require './spec/features/login'
feature 'Creating peeps' do
  include Login

  before(:each) do
    User.create(username: 'faisal',
                email: 'faisal@gmail.com',
                password: 'burgerking',
                password_confirmation: 'burgerking')
  end

  scenario 'create after login' do
    sign_in(email: 'faisal@gmail.com', password: 'burgerking')
    visit '/peep/new'
    fill_in :peep, with: 'Hello, from London'
    click_button 'peep'
    expect(page).to have_content 'faisal: Hello, from London'
  end
end
