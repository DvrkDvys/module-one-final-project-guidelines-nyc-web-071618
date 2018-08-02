require_relative '../config/environment'

account1 = Account.create(email: "andrew@netflix.com", password: "pword", cc: "4444 4444 4444 4448")

account2 = Account.create(email: "jordan@netflix.com", password: "p@ssword", cc: "4444 4444 4444 4448")


andrew = account1.add_user("andrew")

jordan = account2.add_user("jordan")

show1 = Show.create(title: "seinfeld", genre: "comedy", episodes: 40)
Show.create(title: "boondocks", genre: "comedy", episodes: 30)
Show.create(title: "game of thrones", genre: "drama", episodes: 30)
Show.create(title: "orange is the new black", genre: "drama", episodes: 50)
Show.create(title: "dark", genre: "sci-fi", episodes: 12)
Show.create(title: "stanger things", genre: "sci-fi", episodes: 25)
Show.create(title: "narcos", genre: "crime", episodes: 30)
Show.create(title: "jessica jones", genre: "crime", episodes: 30)
Show.create(title: "arrested development", genre: "comedy", episodes: 45)
Show.create(title: "black mirror", genre: "horror", episodes: 28)
Show.create(title: "master of none", genre: "dramedy", episodes: 20)
Show.create(title: "slasher", genre: "horror", episodes: 7)
Show.create(title: "crazy head", genre: "comedy", episodes: 10)
Show.create(title: "luke cage", genre: "action", episodes: 24)
Show.create(title: "the defenders", genre: "action", episodes: 16)
Show.create(title: "the punisher", genre: "action", episodes: 10)
Show.create(title: "the americans", genre: "spy", episodes: 50)
Show.create(title: "the killing eve", genre: "spy", episodes: 14)
Show.create(title: "london spy", genre: "lgbt", episodes: 8)
Show.create(title: "lovesick", genre: "rom-com", episodes: 18)
Show.create(title: "sense 8", genre: "lgbt", episodes: 32)


View.create(user_id: account1.id, show_id: show1.id, view_time: DateTime.now)








# note: Downcase all user input
