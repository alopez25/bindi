require 'terminal-table'
require 'io/console'
require 'unimidi'
require 'artii'
require 'colorize'
require 'colorized_string'
require 'ascii_charts'

def continue_or_quit
  quit = STDIN.getch.downcase
  print "            \r"
  if quit == "q"; exit end
end

def eerie_sound
  notes = [36, 40,36, 40,36, 40,36, 40,36, 40,40,40,40,40,40,40,40,40,40,] # C E G arpeggios
  duration = 0.15
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def win_sound
  notes = [50,60,60,70,80,80] # C E G arpeggios
  duration = 0.15
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def fail_sound
  notes = [30,30,30,30] # C E G arpeggios
  duration = 0.15
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def bip_sound
  notes = [80] # C E G arpeggios
  duration = 1
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def step
  notes = [15] # C E G arpeggios
  duration = 0.8
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end



def cheatmap
  rows = []
  rows << ["#","#","#","#","#","#","#"]
  rows << ["<-",1," ",1,1,1,"#"]
  rows << ["#",1," ",1," ",1,"->"]
  rows << ["#",1,1,1,1," ","#"]
  rows << ["#"," "," ","S"," "," ","#"]
  rows << ["#"," "," ",1," "," ","#"]
  rows << ["#","#","#","#","#","#","#"]
  table = Terminal::Table.new :rows => rows, :title => "Cheat Map"
  puts "\n\n\n"
  puts  table
  puts "\n\n\n"
end

def intro
  puts "\n\n\n\n           You are in a dark room, you can't see a thing!\n"
  puts "             fortunately you can see this text though \n\n\n\n"
  sleep(4)
  puts "      While you figure out what to do three lights quicly flash\n\n"
  sleep(3)
  puts "       "+"FLASH!!\n\n".colorize(:blue).on_white
  sleep(1)
  puts "                                                       "+"FLASH!!\n\n".colorize(:blue).on_white
  sleep(1)
  puts "                               "+"FLASH!!\n\n\n\n\n".colorize(:blue).on_white
  sleep(1)
  puts"                  Press any button to continue"
  continue_or_quit
  system "cls"
  puts "\n\n\n\n\n                      The room goes dark again\n"
  puts "          but you managed to see a path to a mysterious door \n\n\n\n"
  sleep(4)
  puts "                the directions were something like...\n\n"
  sleep(5)
end


door = rand(8..9)

map = [
  [9,9,9,9,9,9,9],
  [door,1,0,1,1,2,9],
  [9,1,0,1,0,1, if door == 8; 9 else 8 end],
  [9,2,1,1,1,0,9],
  [9,0,0,1,0,0,9],
  [9,0,0,1,0,0,9],
  [9,9,9,9,9,9,9]
]

player_pos_Y = 4
player_pos_X = 3


player = map[player_pos_Y][player_pos_X]

intro

if door == 9
  system "cls"
  puts "\n\n\n\n"
  puts "         FORWARD                                          FORWARD\n\n\n\n\n\n\n\n\n\n\n\n".colorize(:red)
  puts "                               FORWARD\n\n\n\n\n\n".colorize(:red)
  puts " RIGHT                       ".colorize(:red)
  sleep(1)
  system "cls"
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  puts "                                                   RIGHT\n\n\n\n\n\n".colorize(:red)
  puts "             BACK\n\n\n\n\n\n".colorize(:red)
  puts "         RIGHT".colorize(:red)
  sleep(0.5)
  system "cls"
else
  system "cls"
  puts "\n\n\n\n"
  puts "         FORWARD                                          LEFT\n\n\n\n\n\n\n\n\n\n\n\n".colorize(:red)
  puts "                               LEFT\n\n\n\n\n\n".colorize(:red)
  puts " FORWARD                       ".colorize(:red)
  sleep(1)
  system "cls"
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  puts "                                                   FORWARD\n\n\n\n\n\n".colorize(:red)
  puts "             LEFT\n\n\n\n\n\n".colorize(:red)
  sleep(0.4)
  system "cls"
end

puts "\n\n\n\n           You also saw that you can easily fall to an abyss\n"
puts "                        if you go off the path \n\n\n\n"
sleep(4)
puts "             Making a huge effort to remember where to go\n"
puts "                          you start moving! \n\n\n\n"
sleep(3)

# cheatmap
puts "\n\n                    Enter a direction at a time"
until player == 8 do
   puts "\n                  FORWARD with 'W', BACK with 'S'"
   puts "                  LEFT with 'A' and RIGHT with 'D'"
   puts "                          and press ENTER"
   puts "\n\n                     If you are a quitter 'Q'".colorize(:red)
   direction = gets.chomp.to_s.downcase
case direction
  when "w"
    player_pos_Y -= 1
  when "s"
    player_pos_Y += 1
  when "a"
    player_pos_X -= 1
  when "d"
    player_pos_X += 1
  when "q"
    exit
  else puts "ONLY W, A, S, D PLEASE"
  end

player = map[player_pos_Y][player_pos_X]

case player
  when 9
    system "cls"
    fail_sound
    puts "\n\n\n\n        You hit a wall. Can't advance anymore in this direction".colorize(:yellow)
    puts "\n                            Keep moving".colorize(:yellow)
    case direction
      when "w"
        player_pos_Y += 1
      when "s"
        player_pos_Y -= 1
      when "a"
        player_pos_X += 1
      when "d"
        player_pos_X -= 1
      else puts "ERROR 102"
    end
  when 8
    win_sound
    system "cls"
    puts "\n\n\n\n                    YOU REACH THE DOOR!!!!!".colorize(:green)
    puts "\n        and are about to see what's on the other side!".colorize(:green)
    puts "\n\n\n\n                 You try to open the door but..."
    puts "\n\n\n    Press any key to continue Bindi's challenges or 'Q' to quit".colorize(:light_blue)
    continue_or_quit
  when 0
    system "cls"
    fail_sound
    puts "\n\n\n\n        There's no path on that direction. You almost died!".colorize(:red)
    puts "\n                 You have to take a minute to recover\n\n\n".colorize(:red)
    i = 10
    9.times { sleep(1); print "      #{i-=1}"   }
    puts "\n\n"
    case direction
      when "w"
        player_pos_Y += 1
      when "s"
        player_pos_Y -= 1
      when "a"
        player_pos_X += 1
      when "d"
        player_pos_X -= 1
      else puts "ERROR 102"
    end
  when 1
    system "cls"
    bip_sound
    puts "\n\n\n\n        Uff! you advanced and are stepping in solid ground".colorize(:green)
    puts "\n                            Keep moving".colorize(:green)
  when 2
    system "cls"
    puts "\n\n\n\n                    You feel something behind you".colorize(:blue)
    puts "\n                     An eerie feeling hunts you!  ".colorize(:blue)
    sleep(1)
    eerie_sound
    puts "\n                 You hear 3 steps moving towards you\n\n\n".colorize(:blue)
    sleep(1)
    i = 4
    3.times { sleep(1); print "                 #{i-=1}"; step   }
    puts "\n\n"
    luck = rand(0..10)
    if luck < 3; player_pos_Y = 5; player_pos_X = 3
      puts "     An unkonw force moves you to an unknown place in the room" .colorize(:red)
    else
      sleep(1)
      puts "                 It was probably your imagination"
      puts "\n                            Keep moving".colorize(:green)
     end
  end

end
