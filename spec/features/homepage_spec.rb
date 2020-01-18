feature 'Homepage' do
  scenario 'Homepage displays Chitter name' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
