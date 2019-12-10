feature 'Sinatra testing' do
  scenario 'see Chitter on signup page' do
    visit '/'
    expect(page).to have_content 'Chitter'
    expect(page).to have_button 'Sign up'
  end
end
