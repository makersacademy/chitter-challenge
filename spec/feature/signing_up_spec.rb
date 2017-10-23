feature 'sign up' do

  scenario 'so I can use chitter I want to sign up for chitter' do
    sign_up
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(Maker, :count)
    expect(current_path).to eq('/makers')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(Maker, :count)
    expect(current_path).to eq('/makers')
    expect(page).to have_content('Email has an invalid format')
  end


  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(Maker, :count)
    expect(page).to have_content('Email is already taken')
  end
end
