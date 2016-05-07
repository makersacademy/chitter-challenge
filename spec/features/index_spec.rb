feature 'Index page' do

  before do
    visit '/'
    expect(page).to have_content 'Chitter'
  end

  scenario 'has sign up button' do
    expect(page).to have_selector("button[value='sign_up']")
  end

  scenario 'has sign in button' do
    expect(page).to have_selector("button[value='sign_in']")
  end
  
end