shared_examples 'required' do |key|
  it "cannot sign up without #{key}" do
    sign_up(**{ key => '' })
    expect(page).to have_content 'Please fill in all fields'
  end
end

feature 'Feature: signing up' do
  include_examples('required', :name)
  include_examples('required', :password)
  include_examples('required', :password_confirmation)
  include_examples('required', :handle)
  include_examples('required', :email)

  scenario 'user enters mismatching passwords' do
    sign_up(confirmation: 'mismatch')
    expect(page.current_path).to eq '/users/new'
    expect(page).to have_content 'Passwords do not match'
  end

  scenario 'user enters valid details' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Welcome, person'
  end
end
