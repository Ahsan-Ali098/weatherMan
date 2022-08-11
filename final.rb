require 'csv'
require 'colorize'

class Weatherman
    attr_accessor :year,:month,:path

    def initialize(year,month,path)
        @year = year
        @month = month
        @path = path
    end

    def print_max(objects)
        max = 0
        for obj in objects
            max = obj[1].to_i
            min = obj[3].to_i
            date = obj[0]
            print "#{date} "
            i=0
            for i in 0..max
                print "+".red
            end
            # print "#{max}C"
            # puts""
            # print "#{date}"
            for i in 0..min
                print "-".blue
            end
            
            print " #{max}C - #{min}C"
            puts""
    
        end
    end

    def file_make
        path2 = path.split("/")
        city_name = path2[5]
        file_name = "/#{city_name}_#{year}_#{month}.txt"
        final = path + file_name
        
        return final
        puts final
    end

    def task_bonus(final)
        objects = CSV.parse(File.read(final),headers: true)

        print_max(objects)
    end

    def task3_print_func(objects)
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

    def task3(final)
        objects = CSV.parse(File.read(final),headers: true)

        task3_print_func(objects)
    end

    def cal_avg_high_temp(objects)
        avg = 0
        sum = 0
        len = objects.length
        for obj in objects
            sum = sum + obj[1].to_i
        end
        avg = sum/len
        return avg
        puts "Avg #{avg}" 
    end
    
    def cal_avg_low_temp(objects)
        avg = 0
        sum = 0
        len = objects.length
        for obj in objects
            sum = sum + obj[1].to_i
        end
        avg = sum/len
        return avg
        puts "Avg #{avg}" 
    end
    
    def avg_humid(objects)
        avg = 0
        sum = 0
        len = objects.length
        for obj in objects
            sum = sum + obj[7].to_i
        end
        return avg = sum/len
    end

    def task2(final)
        avg = []
        avg_humid = []
        objects = CSV.parse(File.read(final),headers: true)
        avg << cal_avg_high_temp(objects)
        avg << cal_avg_low_temp(objects)
        avg_humid << avg_humid(objects)

        
        # end
        # puts avg_humid
        l = avg_humid.length
        puts "Max Avg is:#{avg.max}C"
        puts "Min Avg is:#{avg.min}C"
        sum = 0
        for i in avg_humid
            sum = sum + i
        end
        avg_h = sum/l
        puts "Humid is:#{avg_h}%"
    end
end

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

type = ARGV[0]
year = ARGV[1] 
month =ARGV[2]
month = check_month(month)

path = ARGV[3]

if type == '-b'
    
    w_obj = Weatherman.new(year,month,path)
    puts file = w_obj.file_make
    w_obj.task_bonus(file)
elsif type == '-c'
    w_obj = Weatherman.new(year,month,path)
    puts file = w_obj.file_make
    w_obj.task3(file)
elsif type == '-a'
    w_obj = Weatherman.new(year,month,path)
    puts file = w_obj.file_make
    w_obj.task2(file)
else
    puts "no Operation can be done"
end