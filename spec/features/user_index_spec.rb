require 'rails_helper'

RSpec.feature 'Users Index', type: :feature do
  scenario 'displays the list of users' do
    # Create some users to be rendered in the view
    user1 = User.create(name: 'John')
    user2 = User.create(name: 'Jane')

    # Visit the view
    visit users_path

    # Assert that the view contains the user names
    expect(page).to have_content('List of users')
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end
end
