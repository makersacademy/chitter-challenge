require 'web_helpers'

# STRAIGHT UP

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'being able to peep' do
  scenario 'should be able to display my peep' do
    peep
    expect(page).to have_content('Hello World')
  end
end

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'ordered peeps' do
  scenario 'should be able to order my peeps in reverse chronological order' do
    peep
    peep_again
    within(:css, 'li#peep_0_created_at') do
      expect(page).to have_content("Created at #{Peep.all.last.created_at}")
    end
    within(:css, 'li#peep_1_created_at') do
      expect(page).to have_content("Created at #{Peep.all.first.created_at}")
    end
  end

  scenario 'should show me the time the peeps were generated' do
    peep
    within(:css, 'li#peep_0_created_at') do
      expect(page).to have_content("Created at #{Peep.all.first.created_at}")
    end
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'I can sign up' do
    scenario 'I sign up' do
        sign_up
        expect(page).to have_content()
    end
end
# HARDER

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

# ADVANCED

# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep