class CalendarDisplayer
  

  def initialize(event_list)
    @event_list = event_list
  end

  def line_constructor
    puts "-"*71
  end

  def day_line_constructor(start_day)
    day_line =""    
    7.times {|i| day_line.concat(("|#{i+start_day}").ljust(9," ")) }
    puts day_line + '|'
  end



  def single_event_text(event)
    time_string = event.start_date.strftime("%I:%M%p").ljust(9," ")
    table_words = event.title.split(" ").map {|word| word.ljust(9," ")}.join("")
    return (time_string + table_words).ljust(36," ")
  end

  def row_constructor(start_day)
    line_constructor()
    day_line_constructor(start_day)
    4.times do|line|  

      7.times do |day| 
        reset_line = ""
        puts @event_list.first.start_date.day
        event_of_day = @event_list.select {|event| event.start_date.day == day }.first
        puts event_of_day
        reset_line.concat("|" + single_event_text(event_of_day)[(line*9)..(((line+1)*9)-1)])
      end
      puts reset_line + "|"
    end
  end


end