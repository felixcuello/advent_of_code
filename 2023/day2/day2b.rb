file =  'day2a.in'

if file.nil? || !File.exists?(file)
  puts "File not found: #{file}"
  exit(1)
end

sum = 0
File.readlines(file).each do |line|
  min_red = -1
  min_blue = -1
  min_green = -1

  line = line.chomp
  if /Game (\d+): (.+)/ =~ line
    game_number = $1
    game = $2

    possible = true
    game.split(';').map(&:strip).each do |round|
      counted_colors = {}
      round.split(',').map(&:strip).each do |boxes|
        box = boxes.split(' ')
        counted_colors[box[1]] = box[0].to_i
      end

      min_red = counted_colors['red'].to_i > min_red ? counted_colors['red'].to_i : min_red
      min_green = counted_colors['green'].to_i > min_green ? counted_colors['green'].to_i : min_green
      min_blue = counted_colors['blue'].to_i > min_blue ? counted_colors['blue'].to_i : min_blue
    end
  end # end game

  sum += min_red * min_green * min_blue
end
puts "Sum: #{sum}"
