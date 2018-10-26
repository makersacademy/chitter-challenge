feature 'signing up to chitter' do
  before do
    visit '/'
    click_button 'Sign up'
  end

  scenario 'should fields for email, password, name, and username' do
    expect(page).to have_css("input[type='text'][placeholder='example@gmail.com']")
    expect(page).to have_css("input[type='text'][placeholder='password']")
    expect(page).to have_css("input[type='text'][placeholder='Alice Bobson']")
    expect(page).to have_css("input[type='text'][placeholder='albob123']")
  end
end
