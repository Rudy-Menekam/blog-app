require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Mexico.', postscounter: 5)
    @user2 = User.create(name: 'Bobby', photo: 'https://media.gettyimages.com/id/1250238624/nl/foto/handsome-young-adult-businessman-with-stubble.jpg?s=612x612&w=0&k=20&c=Ahojmst5H08S3yL7kaEj5mN3V8Weguk1V2pWDf4aH2Q=',
                         bio: 'Teacher from Brazil.', postscounter: 3)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit '/'
    expect(page).to have_css(
      "img[src='#{@user.photo}']", wait: 30
    )

    visit '/'
    expect(page).to have_css(
      "img[src='#{@user2.photo}']", wait: 30
    )
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.postscounter)
    expect(page).to have_content(@user2.postscounter)
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name, match: :first)
    expect(page).to have_content(@user.name)
  end
end
