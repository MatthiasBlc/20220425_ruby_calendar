class CalendarDisplayer
  

  def initialize(event_list)
    @event_list = event_list
  end

  def line_constructor
    puts "-"*71
  end

  def day_line_constructor(start_day)
    day_line =""    
    7.times {|i| day_line.concat(("|#{i+start_day <=31 ? i+start_day : ""}").ljust(10," ")) }
    puts day_line + '|'
  end

    




  def single_event_text(event)
    time_string = event.start_date.strftime("%I:%M%p").ljust(9," ")
    table_words = event.title.split(" ").map {|word| word.ljust(9," ")}.join("")
    return (time_string + table_words).ljust(36," ")
  end

  def multi_event_text(events)
    return "#{events.size.to_s.rjust(2,'0')} eventsscheduled".ljust(36, " ")
  end


  def row_constructor(start_day)
    line_constructor()
    day_line_constructor(start_day)
    4.times do|line|  
      reset_line = ""
      for day in (start_day..(start_day+6)) 
        event_of_day = @event_list.select {|event| event.start_date.day == day }
        if event_of_day.first.nil?
          reset_line.concat("|".ljust(10," "))
        elsif event_of_day.size > 1
          reset_line.concat("|" + multi_event_text(event_of_day)[(line*9)..(((line+1)*9)-1)])
        else 
          reset_line.concat("|" + single_event_text(event_of_day.first)[(line*9)..(((line+1)*9)-1)])
        end
      end
      puts reset_line + "|"
    end
  end


  def display
    (1..29).step(7) do |i|
      row_constructor(i)
    end
    line_constructor()
  end
end