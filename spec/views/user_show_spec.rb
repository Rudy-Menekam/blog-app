require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Symo', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'This is my brother.', postscounter: 5)

    @post1 = Post.create(author: @user, title: 'Hello there', text: 'This is my first post')
    @post2 = Post.create(author: @user, title: 'Hello microverse', text: 'This is my second post')
    Post.create(author: @user, title: 'Hello Rails', text: 'This is my third post')
    @post4 = Post.create(author: @user, title: 'Hello Ruby', text: 'This is my fourth post')

    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    expect(page).to have_css(
      "img[src='#{@user.photo}']", wait: 30
    )
  end

  it 'should displays static text' do
    expect(page).to have_text('Number of posts: 5')
    expect(page).to have_text('Bio')
    expect(page).to have_text('This is my brother.')
    expect(page).to have_text('Create new post')
    expect(page).to have_text('See all posts')
    expect(page).to have_text('Back')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.postscounter)
  end

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should render three recent posts' do
    expect(page).to have_no_content(@post1.text)
    expect(page).to have_content(@post4.text)
  end

  it 'renders the user post index page' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
