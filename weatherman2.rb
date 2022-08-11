require 'csv'

filenames_Dubai = Dir.chdir("/home/ahsan/Projetcs/WeatherMan/Dubai_weather") { Dir.entries(".") }


months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

def max_temp(file_name)
arr = []
arr2 = []
date_arr = []
date_arr2= []

CSV.foreach(file_name, headers: true, col_sep: ',') do |row|
    arr << row["Max TemperatureC"].to_i
    date_arr << row["GST"]
  end

   date = arr.index(arr.max)
   arr2 << arr.max
   date_arr2 << arr.index(arr.max)
#    puts arr2
   puts "Max temp #{arr2.max} on #{date_arr[date]}"
#    puts arr
end
def min_temp(file_name)
    arr = []
    date_arr = []
    
    CSV.foreach(file_name, headers: true, col_sep: ',') do |row|
        arr << row["Min TemperatureC"].to_i
        date_arr << row["GST"]
      end
    
       date = arr.index(arr.min)
       puts "min temp #{arr.min} on #{date_arr[date]}"
    end



for month in months
    file_path = "/home/ahsan/Projetcs/WeatherMan/Dubai_weather/"
    file_name = "Dubai_weather_#{year}_#{month}.csv"
    if filenames_Dubai.include?(file_name)
        
        final = file_path<< file_name 
        max_temp(final)
    end

end


year = ARGV[0]
path = ARGV[1]
path2 = path.split("/")
city_name = path2[5]

month = check_month(month)

for month in months
    file_name = "/#{city_name}_#{year}_#{month}.txt"
    final = path + file_name 
    if if filenames_Dubai.include?(final) 

end
