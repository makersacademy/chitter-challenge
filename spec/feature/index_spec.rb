feature 'index' do
  scenario 'login or sign up' do
    visit '/'
    expect(page).to have_content 'Sign up or log in if you want to post a peep or click here to see all the peeps'
  end
end
