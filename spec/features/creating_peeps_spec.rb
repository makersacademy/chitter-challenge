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
    peep
    expect(page).to have_content 'faisal: Hello, from London'
  end

  scenario 'only logged in users can add peeps' do
    visit '/peep/new'
    expect(page).to have_content 'Please Sign in'
  end

  scenario 'peeps have the time' do
    peep
    expect(page).to have_content "#{Time.now}"
  end
end
