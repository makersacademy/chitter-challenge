feature 'User sign up' do
    scenario 'I can sign up as a new user' do
        expect { sign_up }.to change(User, :count).by(1)
        expect(page).to have_content('Hey there, mj!')
        expect(User.first.email).to eq('michael@jackson.com')
        expect(User.first.user_name).to eq('mj')
        expect(User.first.name).to eq('Michael Jackson')
    end
    
    scenario "I can't sign up without an email address" do
        expect { sign_up(email:nil) }.not_to change(User, :count)
        expect(page).to have_content('Email must not be blank')
    end
    
    scenario "I can't sign up without a name" do
        expect { sign_up(name:nil) }.not_to change(User, :count)
        expect(page).to have_content('Name must not be blank')
    end
    
    scenario "I can't sign up without a user name" do
        expect { sign_up(user_name:nil) }.not_to change(User, :count)
        expect(page).to have_content('User name must not be blank')
    end
    
    scenario "I can't sign up with an email that already exists" do
        sign_up
        expect { sign_up }.not_to change(User, :count)
        expect(page).to have_content('Email is already taken')
    end
    
    scenario "I can't sign up with a username that already exists" do
        sign_up(email: 'mick@jagger.com')
        expect { sign_up }.not_to change(User, :count)
        expect(page).to have_content('User name is already taken')
    end
    
    scenario "password and password confirmation must match" do
        expect { sign_up(password_confirmation: "not_password") }.not_to change(User, :count)
    end
        
    # scenario "I can't sign up without a password" do
    #     expect { sign_up(password:nil) }.not_to change(User, :count)
    #     expect(page).to have_content('Password must not be blank')
    # end
end

=begin
Future tests:
    requires a matching confirmation password

=end
