require 'date'
# keep track of day of week
# keep track of date
  # including using leap years
# increment some sort of counter whenever day == friday && date == 13
# will need to iterate through the days of the year that's passed in

# how to keep track of months?
# year, month, day

# methods: .friday?   .leap?   
# iterate through each month of year and increment if the 13th .friday? returns true

def friday_the_thirteenths(yr)
#  p Date.new(yr,9,28).friday?
  count = 0
  for month in (1..12)
    if Date.new(yr,month,13).friday?
      count += 1
    end
  end
  puts count
end

friday_the_thirteenths(2018)
friday_the_thirteenths(2015)
friday_the_thirteenths(1986)
