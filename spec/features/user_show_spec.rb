require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { User.create(name: 'John', bio: 'Some bio') }

  scenario 'displays user details and posts' do
    # Create some posts for the user
    post1 = user.posts.create(title: 'Post 1', text: 'Content 1')
    post2 = user.posts.create(title: 'Post 2', text: 'Content 2')

    # visit user_path(user)
    visit "/users/#{user.id}"

    expect(page).to have_content('A given User detail with posts')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.bio)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post2.text)

    expect(page).to have_link('Create new post', href: new_user_post_path(user))
    expect(page).to have_link('See all posts', href: "#{user.id}/posts")
    expect(page).to have_link('Back', href: :back)
  end
end
