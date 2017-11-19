

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: 'suze'
    fill_in :email,    with: 'email@example.eg'
    fill_in :username, with: 'shuldt'
    fill_in :password, with: 'pwex'
    click_button 'sign up!'

    expect(page).to have_content('welcome, suze')
    expect(User.first.email).to eq('email@example.eg')
  end
end

feature 'user sign in' do
  scenario 'I can sign in as a new user' do
    visit '/'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'email@example.eg'
    fill_in :password, with: 'pwex'
    click_button 'sign in'
    expect(page).to have_content('welcome back, suze')
  end
end
