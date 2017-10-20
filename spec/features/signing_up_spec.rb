feature 'signing up for chitter' do
  
    scenario 'I can sign up to chitter' do
      expect { sign_up }.to change { User.all.count }.by 1
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Welcome, Ainsley'
    end
    scenario 'I cannot sign up twice with the same email' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'email already exists'
    end
    scenario 'I cannot sign up twice with same handle' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'handle already exists'
    end
  
  end
