feature 'signing up for chitter' do
  
    scenario 'user signs into to chitter' do
      expect { sign_up }.to change { User.all.count }.by 1
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Welcome, Ainsley'
    end
    scenario 'user is not able to sign up twice with same email' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'email already exists'
    end
    scenario 'user is not able to sign up twice with same handle' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'handle already exists'
    end
  
  end
