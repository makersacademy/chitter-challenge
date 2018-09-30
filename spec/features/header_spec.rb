feature 'header' do
  context 'user is not logged in' do
    scenario 'login' do
      visit '/'
      click_link('Log In')
      expect(current_path).to eq '/user/login'
    end
  end

  context 'user is logged in' do
    scenario 'log out' do

    end

    scenario 'log out' do

    end
  end
end
