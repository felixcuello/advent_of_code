file =  'day2a.in'

if file.nil? || !File.exists?(file)
  puts "File not found: #{file}"
  exit(1)
end

sum = 0
File.readlines(file).each do |line|
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

      possible &&= counted_colors['red'] <= 12 if counted_colors.key?('red')
      possible &&= counted_colors['green'] <= 13 if counted_colors.key?('green')
      possible &&= counted_colors['blue'] <= 14 if counted_colors.key?('blue')
    end
    
    puts "#{game_number} : #{possible}"
    sum += game_number.to_i if possible
  end
end
puts "Sum: #{sum}"
