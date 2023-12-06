def debug_map(map)
  map.each do |row|
    puts row.join('')
  end
end

def symbol?(map, row, col)
  return false if row < 0 || row >= map.length || col < 0 || col >= map[0].length
  return false if((map[row][col] == '.') || (/\d/.match map[row][col]))

  true
end


def dfs_valid(map, row, col)
  while((col <= map[0].length) && (/\d/.match map[row][col]))
#    debug_map(map)
    map[row][col] = '.'
    if symbol?(map, row-1, col-1) || # top left
       symbol?(map, row, col-1) ||   # left
       symbol?(map, row+1, col-1) || # bottom left
       symbol?(map, row-1, col) ||   # top
       symbol?(map, row+1, col) ||   # bottom
       symbol?(map, row-1, col+1) || # top right
       symbol?(map, row, col+1) ||   # right
       symbol?(map, row+1, col+1)    # bottom right
      @valid = true
    end
    col += 1
  end
end

# return the number starting from row,col
def number(map, row, col)
  return '' if col >= map[0].length
  return '' unless /\d/.match map[row][col]

  map[row][col] + number(map, row, col+1)
end


file =  'day3a.in'

if file.nil? || !File.exists?(file)
  puts "File not found: #{file}"
  exit(1)
end

map = []
File.readlines(file).each do |line|
  map << line.chomp.split('')
end

rows = map.length
cols = map[0].length

sum = 0
rows.times do |row|
  cols.times do |col|
    number = number(map, row, col).to_i
    @valid = false
    dfs_valid(map, row, col)

    sum += number.to_i if @valid
  end
end
puts sum
