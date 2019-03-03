feature 'signing up to chitter' do
  before do
    visit '/'
    click_button 'Sign up'
  end

  scenario 'shows fields for email, password, name, and username' do
    expect(page).to have_css("input[type='text'][placeholder='example@gmail.com']")
    expect(page).to have_css("input[type='text'][placeholder='password']")
    expect(page).to have_css("input[type='text'][placeholder='Your name']")
    expect(page).to have_css("input[type='text'][placeholder='Your username']")
  end
end
