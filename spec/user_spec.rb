describe User do 

  feature "User signs up" do

    scenario 'with a user name and passwors' do
      expect{ sign_up }.to change(User, :count).by(1)
    end

    def sign_up
      visit '/users/new'
      fill_in :username, :with => 'Ed'
      fill_in :password, :with => 'password'
      click_button 'Sign up'
    end

  end


  
end