require 'spec_helper'
feature 'user can see all the peeps' do
  let!(:user) do
    User.create(email: 'becca@gmail.com',
                name: 'Becca',
                username: 'pregnantwombat',
                password: 'haircut',
                password_confirmation: 'haircut')
  end
  scenario 'user can see all the peeps in peep list' do
    sign_in
    visit '/peep/list'
  end
end
