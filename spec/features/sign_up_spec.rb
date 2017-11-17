def sign_in(username, password)
  visit('/sign-up')
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Complete')
end

feature 'Feature: signing up' do
  scenario 'user does not enter email' do
    sign_in('', 'secret')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'user does not enter password' do
    sign_in('example@domain.com', '')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'invalid sign-up attempt does not generate a user' do
    expect { sign_in('example@domain.com', '') }.to_not change { User.count }
    expect { sign_in('', 'secret') }.to_not change { User.count }
  end

  scenario 'user enters valid details' do
    expect { sign_in('example@domain.com', 'secret') }
      .to change { User.count }.by(1)
    expect(page).to have_content 'Welcome, example@domain.com' 
  end
end
