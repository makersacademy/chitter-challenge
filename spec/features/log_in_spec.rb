# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Log in to Chitter' do

  scenario 'A user can log in' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    # register_user
    visit('/')
    # user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    # session[:registered] = true
    # p current_path
    # click_link('Login')
    # p current_path
    # p "dfdsf"
    # p current_path
    fill_in :username, with: 'peeper1234'
    fill_in :password, with: 'p4s5w0rd'
    click_button('Login')
     # p current_path
    expect(page).to have_content "Welcome to Chitter, peeper1234"

  # (200 .. 399).should include(page.status_code)

  end

  scenario 'login does not work if no matching user' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    visit('/')
    fill_in :username, with: 'peeper1234'
    fill_in :password, with: 'p4s5w0rd-wrong'
    click_button('Login')
     # p current_path
    expect(page).to have_content "Incorrect username or password. Please try again"
    expect(page).to_not have_content "Welcome to Chitter, peeper1234"

  end
end
