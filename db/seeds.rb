# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
second_user = User.create(name: 'Rudy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Cameroon.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
Post.create(author: first_user, title: 'Hello', text: 'This is my subsequent post')
Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
Post.create(author: second_user, title: 'Hello', text: 'This is my hundreth post')
Post.create(author: second_user, title: 'Hello', text: 'This is my fourteenth post')
Post.create(author: third_user, title: 'Hello', text: 'This is my fifth post')
Post.create(author: third_user, title: 'Hello', text: 'This is my seventh post')
Post.create(author: first_user, title: 'Hello', text: 'This is my 12th post')
Post.create(author: first_user, title: 'Hello', text: 'This is my 17th post')
Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi alice!' )
Comment.create(post: first_post, author: first_user, text: 'Hi grace!' )
Comment.create(post: first_post, author: first_user, text: 'Hi ali!' )
Comment.create(post: first_post, author: first_user, text: 'Hi edwin!' )
Comment.create(post: first_post, author: first_user, text: 'Hi hel' )
Comment.create(post: first_post, author: first_user, text: 'Hi ny!' )
Comment.create(post: first_post, author: first_user, text: 'Hivk!')