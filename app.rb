# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/CalendarDisplayer'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

# michel = User.new("test@test.com",25)
# marc = User.new("test2542@test.com",18)
# # puts michel.age
# # puts michel.email

#  puts User.all



# bestevent = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])

# # puts bestevent.start_date
# # puts bestevent.duration
# # puts bestevent.title
# # puts bestevent.attendees

# bestevent.postpone_24h

# # puts bestevent.start_date

# # puts bestevent.end_date

# # puts bestevent.is_past?
# # puts bestevent.is_future?
# # puts bestevent.is_soon?

# bestevent.to_s



newevent = Event.new("2022-01-01 09:00", 10, "Sandbox calendar challenge", ["truc@machin.com", "bidule@chose.fr"])


CalendarDisplayer.new(Event.all).row_constructor(1)



# binding.pry
# puts "end of file"