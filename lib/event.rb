class Event

  attr_accessor :start_date, :duration, :title, :attendees
  @@all_event = []

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
    @@all_event << self
  end

  def postpone_24h
    return @start_date += 24*60*60
  end

  def end_date

    return @end_date = @start_date += duration
  end

  def is_past?
    return start_date < Time.now
  end

  def is_future?
    return start_date > Time.now
  end

  def is_soon?
    return start_date <= Time.now && Time.now <= (start_date + 30*60)
  end

  def self.all
    return @@all_event
  end

  # def start_date
  #   return @start_date
  # end


  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end

end