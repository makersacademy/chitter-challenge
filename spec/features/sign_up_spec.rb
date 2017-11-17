def sign_in(name: 'theo', password: 'secret', email: 't@bw.com', 
            handle: 'tdog')
  visit('/sign-up')
  fill_in('name', with: name)
  fill_in('password', with: password)
  fill_in('handle', with: handle)
  fill_in('email', with: email)
  click_button('Complete')
end

feature 'Feature: signing up' do
  scenario 'user does not enter email' do
    sign_in(email: '')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'user does not enter handle' do
    sign_in(handle: '')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'user does not enter name' do
    sign_in(name: '')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'user does not enter password' do
    sign_in(password: '')
    expect(page.current_path).to eq '/sign-up'
  end 

  scenario 'invalid sign-up attempt does not generate a user' do
    expect { sign_in(name: '') }.to_not change { User.count }
    expect { sign_in(password: '') }.to_not change { User.count }
    expect { sign_in(handle: '') }.to_not change { User.count }
    expect { sign_in(email: '') }.to_not change { User.count }
  end

  scenario 'user enters valid details' do
    expect { sign_in }.to change { User.count }.by(1)
    expect(page).to have_content 'Welcome, theo'
  end
end
