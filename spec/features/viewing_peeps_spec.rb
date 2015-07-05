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
    peep
    within 'ul#peeps' do
      expect(page).to have_content("Hello, from London")
    end
  end
end
