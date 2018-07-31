require_relative '../config/environment'

test1 = Account.create(email: "test1@netflix.com", password: "pword", cc: "4444 4444 4444 4448")


user1 = test1.add_user("user1")
