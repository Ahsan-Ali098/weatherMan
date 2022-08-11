require 'csv'
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
filenames_lahore = Dir.chdir("/home/ahsan/Projetcs/WeatherMan/lahore_weather") { Dir.entries(".") }
# puts filenames_lahore.sort

year = ARGV[0]
path = ARGV[1]
path2 = path.split("/")
city_name = path2[5]

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
dir_to_check = city_name

for month in months
    file_name = "/#{city_name}_#{year}_#{month}.txt"
    final = path + file_name 
    puts final
    if filenames_lahore.include?(final)
        puts "true"
    end

end

