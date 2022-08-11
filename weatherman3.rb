require 'csv'
require 'colorize'

def check_month(month)
    if month == '1'
        puts "in if"
        month = 'Jan'
        # puts "#{month}"
    elsif month == '2'
        month = 'Feb'
    elsif month == '3'
        month = 'Mar'
    elsif month == '4'
        month = 'Apr'
    elsif month == '5'
        month = 'May'
    elsif month == '6'
        month = 'Jun'
    elsif month == '7'
        month = 'Jul'
    elsif month == '8'
        month = 'Aug'
    elsif month == '9'
        month = 'Sep'
    elsif month == '10'
        month = 'Oct'
    elsif month == '11'
        month = 'Nov'
    elsif month == '12'
        month = 'Dec'
    end
    return month
end

def print_max(objects)
    max = 0
    for obj in objects
        max = obj[1].to_i
        min = obj[3].to_i
        date = obj[0]
        print "#{date}"
        i=0
        for i in 0..max
            print "+".red
        end
        print "#{max}C"
        puts""
        print "#{date}"
        for i in 0..min
            print "-".blue
        end
        print "#{min}C"
        puts""

    end
end

year = ARGV[1]
month =ARGV[2]
path = ARGV[3]
# puts path
path2 = path.split("/")
city_name = path2[5]
# puts city_name
month = check_month(month)
file_name = "/#{city_name}_#{year}_#{month}.txt"

final = path + file_name
puts final

objects = CSV.parse(File.read(final),headers: true)

print_max(objects)

