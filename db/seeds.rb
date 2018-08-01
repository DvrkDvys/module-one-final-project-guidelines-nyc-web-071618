
test1 = Account.create(email: "test1@netflix.com", password: "pword", cc: "4444 4444 4444 4448")

user1 = test1.add_user("user1")
user2 = test1.add_user("user2")
user3 = test1.add_user("user3")

show1 = Show.create(title: "seinfeld", genre: "comedy", episodes: 40)
show2 = Show.create(title: "boondocks", genre: "comedy", episodes: 30)
show3 = Show.create(title: "game of Thrones", genre: "drama", episodes: 50)

View.create(user_id: user1.id, show_id: show1.id, view_time: DateTime.now)
# View.create(user_id: user1.id, show_id: show2.id, view_time: DateTime.now)
