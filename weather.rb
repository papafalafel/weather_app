require 'barometer'


puts "Where are you from?"
location = gets.chomp

def tomorrow
  tomorrow = Time.now.strftime('%d').to_i + 1
end

def weather (location)
  barometer = Barometer.new(location)
  weather = barometer.measure


    weather.forecast.each do |forecast|
      day = forecast.starts_at.day

        if day == tomorrow.to_i - 1
          dayName = 'Today'
        elsif day == tomorrow
          dayName = 'Tomorrow'
        else
          dayName = forecast.starts_at.strftime('%A')
        end

    puts dayName + ' is going to be ' + forecast.icon + ' with a low of: ' + forecast.low.f.to_s + ', and a high of: ' + forecast.high.f.to_s
  end
end

weather (location)
