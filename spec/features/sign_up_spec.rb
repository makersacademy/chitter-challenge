shared_examples 'required' do |key|
  scenario  "cannot sign up without #{key}" do
    expect { sign_up(**{ key => nil }) }.not_to change { User.count }
  end
end

shared_examples 'unique' do |key|
  scenario "cannot sign up with duplicate #{key}" do
    sign_up(**{ key => nil })
    expect { sign_up(**{ key => nil }) }.not_to change { User.count }
  end
end

feature 'Feature: signing up' do
  include_examples('required', :name)
  include_examples('required', :password)
  include_examples('required', :confirmation)
  include_examples('required', :handle)
  include_examples('required', :email)

  include_examples('unique', :email)
  include_examples('unique', :handle)

  scenario 'user enters mismatching passwords' do
    expect { sign_up(confirmation: 'mismatch') }.not_to change { User.count }
  end

  scenario 'user enters invalid email' do
    expect { sign_up(email: 'malformed') }.not_to change { User.count }
  end

  scenario 'user enters valid details' do
    expect { sign_up }.to change { User.count }.by 1
    expect(page).to have_content 'Welcome, person'
  end
end
