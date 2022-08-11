require 'csv'
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
def max_temp(objects)
    max = 0
    date = ''
    for obj in objects
        if obj[1].to_i >= max.to_i
            max = obj[1]
            date = obj[0]
        end
    end
    return max
end
def min_temp(objects)
    min = 2000
    date = ''
    for obj in objects
        if obj[3].to_i <= min.to_i
            min = obj[3]
            date = obj[0]
        end
    end
    return min
# puts "Min temp is #{min} on #{date} "
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


max_arr = []
min_arr = []

task_option = ARGV[0]
year = ARGV[1]
month = ARGV[2]
user_path = ARGV[3]
##################whic tsk to run
# if task_option == '-a'
    
# end

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
avg << cal_avg_high_temp(objects)
avg << cal_avg_low_temp(objects)
avg_humid<<avg_humid(objects)

        
        # final = file_path<< file_name
        
        
        # puts "in if"
        # max_arr << max_temp(objects)
        # puts max_arr.max
        # date << date_check(objects,'29')
        #####Check Min ############
        # min_arr << min_temp(objects)
        # puts min_arr.min
        # date << date_check(objects,'0')
        ##########################################################
        
    
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
# puts "highest temp is: #{max_arr.max()} on #{date[0]}"
# puts "MIn temp is: #{min_arr.min} on #{date[0]}"