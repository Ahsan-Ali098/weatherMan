require 'csv'

filenames_Dubai = Dir.chdir("/home/ahsan/Projetcs/WeatherMan/Dubai_weather") { Dir.entries(".") }
# puts filenames_Dubai
# filenames_Murree = Dir.chdir("/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/Murree_weather") { Dir.entries(".") }
# filenames_lahore = Dir.chdir("/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/lahore_weather") { Dir.entries(".") }

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
def date_check()

cities = ["lahore","Dubai","Murree"]
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

year = "2004"
# puts filenames_Dubai.include?('Dubai_weather_2004_Dec.csv')
max_arr = []
for month in months
    
    file_path = "/home/ahsan/Projetcs/WeatherMan/Dubai_weather/"
    file_name = "Dubai_weather_#{year}_#{month}.csv"
    if filenames_Dubai.include?(file_name)
        # max_arr = []
        final = file_path<< file_name 
        # puts final
        objects = CSV.parse(File.read(final),headers: true)
        max_arr << max_temp(objects)
        ##########################################################

    end
    
end
puts "highest temp is: #{max_arr.max()}"














# year = '2004'
# file_name_dubai = "Dubai_weather/Dubai_weather_" + year 
# files = Dir.glob('Dubai_weather/**/*').select { |path| File.file?(path) }
# if files[0] == 'Dubai_weather/Dubai_weather_2004'
#     puts'in loop'
# end


# def min_temp(objects)
#     min = 2000
#     date = ''
#     for obj in objects
#         if obj[3].to_i <= min.to_i
#             min = obj[3]
#             date = obj[0]
#         end
#     end
# puts "Min temp is #{min} on #{date} "
# end
# def max_humid(objects)
#     max = 0
#     date = ''
#     for obj in objects
#         if obj[7].to_i >= max.to_i
#             max = obj[7]
#             date = obj[0]
#         end
#     end
# puts "Max humid day is #{max}% on #{date} "
# end
# max_temp(objects)
# min_temp(objects)
# max_humid(objects)