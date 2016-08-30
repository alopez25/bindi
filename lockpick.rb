require 'terminal-table'
require 'io/console'
require 'unimidi'
require 'artii'
require 'colorize'
require 'colorized_string'
require 'ascii_charts'

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

def continue_or_quit
  quit = STDIN.getch.downcase
  print "            \r"
  if quit == "q"; exit end
end

def click_sound
  notes = [100] # C E G arpeggios
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

randcomb = ["s", "w"]
comb = [randcomb.sample,randcomb.sample,randcomb.sample,randcomb.sample,randcomb.sample]
pass = 0
give_up = 0
str1 = nil
str2 = nil
str3 = nil
str4 = nil
str5 = nil
turn = 0


def intro
  system "cls"
  puts "\n\n\n\n                    THE DOOR IS LOCKED!!!!!".colorize(:red)
  puts "\n            you kick and pull but it won't open"
  puts "\n\n\n\n        Your only chance is to try picking the lock..."
end

intro


until pass == 1 do
# print "\n  HERE'S THE COMBINATION YOU CHEAT! --> #{comb}" #COVER CHEAT

puts """\n
                           ___________
                          |  _ _ _ _  |
                          | | | | | | |
                          | |-+-+-+-| |
                          | |-+-+-+-| |
                          | |_|_|_|_| |
                          |    ___    |
                          |   [___] ()|
                          |         |||
                          |         ()|
                          |           |
                          |           |
                          |           |
                          |___________|
\n
"""
  begin
    puts "\n\n                 Press 'W' to move the pick UP"
    puts "\n                    and 'S' to move it down\n\n"
    system("stty raw -echo")
    str1 = STDIN.getc.downcase
    click_sound
    str2 = STDIN.getc.downcase
    click_sound
    str3 = STDIN.getc.downcase
    click_sound
    str4 = STDIN.getc.downcase
    click_sound
    str5 = STDIN.getc.downcase
    click_sound
    ensure
    system("stty -raw echo")
  end

result = []

picks = [str1, str2, str3, str4, str5]
# print picks

picks.each_with_index { |x,y|  x == comb[y] ? result << "CLICK!" : result << "~crack~" }
puts "\n"
result.each { |x| print "  | #{x} | ".colorize(:yellow)}
sleep (4)
system "cls"

if picks.any? { |x| x != "s" && x != "w"}; puts "\n\n Remember that only moving the pin UP ('w') or DOWN ('s') would help" end

if picks == comb
  luck = rand(0..10)
  if luck < 7 && turn > 1 ; pass = 1;
    puts "\n\n\n\n"
    puts "
                             ___________
                          | |  /|,| |   |
                          | | |,x,| |   |
                          | | |,x,' |   |
                          | | |,x   ,   |
                          | | |/    |   |
                          | |    /] ,   |
                          | |   [/ ()   |
                          | |       |   |
                          | |       |   |
                          | |       |   |
                          | |      ,'   |
                          | |   ,'      |
                          |_|,'_________|
    \n
    ".colorize(:green)
    win_sound
    puts "\n\n              YOU MADE IT, YOU UNLUCKED THE DOOR!!!!!".colorize(:green)
    puts "\n                  you can open it and leave the room".colorize(:green)
    puts "\n\n\n     Press any key to continue the last of Bindi's challenges"
    puts"                          or 'Q' to quit"
    continue_or_quit
    system "cls"
  else
    turn += 1
    fail_sound
    puts"\n\n\n\n"
    puts "     YOU'VE GOT THE COMBINATION RIGHT BUT THE PICK BROKE!\n\n\n".colorize(:yellow)
    puts "    Press any key to keep trying or 'Q' if you are a QUITTER"
    continue_or_quit
    end
else
  puts"\n\n\n\n"
  fail_sound
  puts "    The combination didn't work. THE DOOR IS STILL LOCKED!\n\n\n".colorize(:red)
  puts "    Press any key to keep trying or 'Q' if you are a QUITTER"
  continue_or_quit
end

end
