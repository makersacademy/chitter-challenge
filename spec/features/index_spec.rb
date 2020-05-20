feature 'welcome page' do
  scenario 'on welcome page, user can see welcome page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'login' do
  scenario 'on welcome page, user can click login link' do
    visit('/')
    click_link('Login!')
    expect(page).to have_content "Log back into Chitter!"
  end
end

feature 'register' do
  scenario 'on welcome page, user can click register link' do
    visit('/')
    click_link('Register!')
    expect(page).to have_content "Create a new Chitter account!"
  end
end
