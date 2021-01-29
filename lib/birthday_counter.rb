require "date"

class BirthdayCounter

  attr_reader :birthdate

  def initialize(day, month)
    @birthdate = Date.new(Date.today.year, month.to_i, day.to_i)

  end

  def today?
    now = Date.today
    (@birthdate.day == now.day) && (@birthdate.month == now.month) 
  end

  def days_until(added_year = 0)
    days = (@birthdate.next_year(added_year) - Date.today).to_i
    days >= 0 ? days : days_until(1)
  end

  def message
    return "Happy birthday" if today?
    days_until < 40 ? "Good news" : "Bad news"
  end

end
