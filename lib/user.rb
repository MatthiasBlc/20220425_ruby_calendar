require "pry"

class User

attr_accessor :email, :age
@@all_user = []

  def initialize(email, age)
    @email = email
    @age = age
    @@all_user << self
  end


  def self.all
    return @@all_user
  end


  def self.find_by_email (email)
    @@all_user.each {|user| user.email == email ? (return user) : (puts "wallou") } 
  end


end