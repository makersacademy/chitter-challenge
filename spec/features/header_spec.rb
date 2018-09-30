feature 'header' do
  context 'user is not logged in' do
    scenario 'login' do
      User.class_variable_set(:@@current_user, nil)
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
