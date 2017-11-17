feature 'Feature: signing up' do
  scenario 'user does not enter email' do
    sign_up(email: '')
    expect(page.current_path).to eq '/users/new'
  end 

  scenario 'user does not enter handle' do
    sign_up(handle: '')
    expect(page.current_path).to eq '/users/new'
  end 

  scenario 'user does not enter name' do
    sign_up(name: '')
    expect(page.current_path).to eq '/users/new'
  end 

  scenario 'user does not enter password' do
    sign_up(password: '')
    expect(page.current_path).to eq '/users/new'
  end 

  scenario 'invalid sign-up attempt does not generate a user' do
    expect { sign_up(name: '') }.to_not change { User.count }
    expect { sign_up(password: '') }.to_not change { User.count }
    expect { sign_up(handle: '') }.to_not change { User.count }
    expect { sign_up(email: '') }.to_not change { User.count }
  end

  scenario 'user enters valid details' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Welcome, person'
  end
end
