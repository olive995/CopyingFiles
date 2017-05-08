@from_file, @to_file = ARGV


def file_copy(in_data,out_data, g)
  @in_data = File.open(@from_file, "w+")
  @out_data = IO.write(@in_data.read(), @to_file)
  puts "Would you like to copy the contents of #{@from_file} to #{@to_file}?\n"
  @g = $stdin.gets.chomp.upcase
  if @g == "YES"
    @in_data.write(@out_data)
    puts "Your file has been copied over to #{@to_file}!"
  elsif @g == "NO"
    return "Your file will not be read!"
  else
    puts "\nYour answer did not make sense to the machine. Please answer 'yes' or 'no'.\nTry again"
    return file_copy(@in_data, @out_data, @g)
  end
end
file_copy(@in_data, @out_data, @g)
def read_file(readfile)
  puts "Would you like to read the contents of your newly overwritten file?"
  @readfile = $stdin.gets.chomp.upcase
  if @readfile == "YES"
    puts "The contents of your new file reads as:\n", File.read(@to_file)
  elsif @readfile == "NO"
    puts "Your file will not be written. This program is over."
    return exit
  else
    puts "Your answer could not be recognized. Please answer 'yes' or 'no'.\nTry again:"
    return read_file(@readfile)
  end
end
read_file(@readfile)
