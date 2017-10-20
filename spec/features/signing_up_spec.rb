feature 'signing up for chitter' do
  
    scenario 'user signs into to chitter' do
      expect { sign_up }.to change { User.all.count }.by 1
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Welcome, Ainsley'
    end
    scenario 'user is not able to sign up twice with email' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'account already exists'
    end
  
  end
