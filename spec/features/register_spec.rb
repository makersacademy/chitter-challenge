feature "User register" do  

  scenario 'with valid email and password' do
    valid_user = build :user

    register_with valid_user

    expect(page).to have_content( "Welcome")
  end

  # scenario 'with duplicate user_name' do
  #   first_user  = create :user
  #   second_user = build  :user

  #   register_with second_user

  #   expect(User.count).to eq 1
  #   expect(page).to have_content("User name taken")
  # end

  def register_with user
    visit '/register'

    fill_in 'email',                 with: user.email, :match => :prefer_exact
    fill_in 'password',              with: user.password, :match => :prefer_exact
    fill_in 'name',                  with: user.name, :match => :prefer_exact
    fill_in 'user_name',             with: user.user_name, :match => :prefer_exact
    fill_in 'password_confirmation', with: user.password_confirmation, :match => :prefer_exact

    click_button 'Registrate'
  end

  # scenario "when no current user" do
  #   visit '/'
  #   expect(page).to have_selector(:link_or_button, 'Register')
  # end

  # scenario "able to create user filling correctly all the filds" do
  #   visit '/register'
  #   expect(page).to have_content("Create a new user")

  #   fill_in :email,                 with: user.email
  #   fill_in :password,              with: user.password
  #   fill_in :name,                  with: user.name
  #   fill_in :user_name,             with: user.user_name
  #   fill_in :password_confirmation, with: user.password_confirmation
  #   click_button 'Registrate'

  #   expect(page).to have_content("Welcome")
  # end

  # scenario "unable to register when missing email" do
  #   visit '/register'

  #   fill_in :email,    with: "", :match => :prefer_exact
  #   fill_in :password, with: user.password, :match => :prefer_exact
  #   fill_in :name, with: user.name, :match => :prefer_exact
  #   fill_in :user_name, with: user.user_name, :match => :prefer_exact
  #   fill_in :password_confirmation, with: user.password_confirmation, :match => :prefer_exact
  #   click_button 'Registrate'
  #   expect(page).to have_content("Email required")
  # end

  # scenario "unable to register when passwords are not matching" do
  #   visit '/register'

  #   fill_in :email,    with: "user.email", :match => :prefer_exact
  #   fill_in :password, with: user.password, :match => :prefer_exact
  #   fill_in :name, with: user.name, :match => :prefer_exact
  #   fill_in :user_name, with: user.user_name, :match => :prefer_exact
  #   fill_in :password_confirmation, with: "potato", :match => :prefer_exact
  #   click_button 'Registrate'
  #   expect(page).to have_content("Password and confirmation password do not match")
  # end
end