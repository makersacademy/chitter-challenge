
describe 'Home Page' do

  def go_to_home_page; visit '/'; end

  def go_to_login; visit '/login'; end

  def go_to_register; visit '/register'; end

  def log_in;
    go_to_login
    # fill in form
    # submit
  end

  def create_account
    go_to_register
    # fill in form
    # submit
    # log_in
  end

  feature 'home page when not logged in' do

    before do
      go_to_home_page
    end

    scenario 'redirects to login form' do
      expect(current_path).to eq '/login'
    end

  end

  feature 'home page login form' do

    before do
      go_to_login
    end

    scenario 'displays log in form' do
      expect(page).to have_content('Log In')
      expect(page).to have_content('username:')
      expect(page).to have_content('password:')
    end

    scenario 'displays link to register form' do
      expect(page).to have_content('register new account')
    end

    scenario 'has valid url link to register form' do
      expect(page).to have_link('/register')
    end

    scenario 'displays latest posts' do
      expect(page).to have_content('Lastest Posts:')
    end

    scenario 'does not display form for new posts' do
      expect(page).to_not have_content('Create New Post:')
    end
  end

  feature 'home page register form' do

    before do
      go_to_register
    end

    scenario 'displays log in form' do
      expect(page).to have_content('Log In')
      expect(page).to have_content('username:')
      expect(page).to have_content('password:')
    end

    scenario 'displays link to register form' do
      expect(page).to have_link('/register')
    end

    scenario 'displays latest posts' do
      expect(page).to have_content('Lastest Posts:')
    end

    scenario 'does not display form for new posts' do
      expect(page).to_not have_content('Create New Post:')
    end

  end

  feature 'home page when logged in' do

    before do
      create_account
    end

    scenario 'does not display log in form' do
      expect(page).to_not have_content('Log In')
      expect(page).to_not have_content('username:')
      expect(page).to_not have_content('password:')
    end

    scenario 'does not display link to register form' do
      expect(page).to_not have_link('/register')
    end

    scenario 'displays latest posts' do
      expect(page).to have_content('Lastest Posts:')
    end

    scenario 'displays form for new posts' do
      expect(page).to have_content('Create New Post:')
    end
  end
end
