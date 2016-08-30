require 'terminal-table'
require 'io/console'
require 'unimidi'
require 'artii'
require 'colorize'
require 'colorized_string'
require 'ascii_charts'

class Character
  def initialize
    @disadvantage = disadvantage
    @cheater = cheater
    @luck = luck
  end

  attr_accessor :disadvantage, :cheater
end

class Donor
  def initialize(name,donation_amount,contact_details, time)
    @name = name
    @donation_amount = donation_amount
    @contact_details = contact_details
    @time = time
  end

  def self.all
    ObjectSpace.each_object(self).to_a.sort
  end

  attr_accessor :name, :donation_amount, :contact_details, :time
end

def continue_or_quit
  quit = STDIN.getch.downcase
  print "            \r"
  if quit == "q"; system "cls"; exit end
end

def artiify(content)
  a = Artii::Base.new :font => 'slant'
  puts a.asciify(content)
end

def play_music
  notes = [36, 40, 43, 48, 52, 55, 60, 64, 67, 36, 40, 43, 48, 52, 55, 60, 64, 67,36, 40, 43, 48, 52, 55, 60, 64, 67, 64, 60, 55, 52, 48, 48] # C E G arpeggios
  duration = 0.05
  output = UniMIDI::Output.open(:first)
  output.open do |output|
    notes.each do |note|
      output.puts(0x90, note, 100) # note on message
      sleep(duration)  # wait
      output.puts(0x80, note, 100) # note off message
    end
  end
end

def creator_at_work
  puts "\n\n\n\n\n\n\n\n"
  puts "                 God has started cooking you!\n\n\n".colorize(:red)
  3.times { sleep(1); print "         = Brain ="  }
  puts "\n"
  3.times { sleep(1); print "         = Heart ="  }
  puts "\n"
  3.times { sleep(1); print "   = Viscous stuff =" }
  sleep(1)
  puts "\n\n\n          almost done... just attaching your legs\n\n\n"
  sleep(1)
  3.times { sleep(1); print "         = Legs = "  }
  puts "\n\n\n"
  sleep(1.5)
  puts "                     DONE YOU NOW EXIST!!"
  puts "\n\n"
  sleep(1)
  puts "           You are" + " BINDI".colorize(:blue) + " an indigenous Australian!!"
  puts "\n\n\n"
end

def introduction
  system "cls"
  puts "\n\n\n\n\n\n\n\n\n\n"
  print artiify("         BINDI")
  play_music
end

introduction
puts "\n\n\n                  Press any button to continue"
continue_or_quit

system "cls"

puts "\n\n\n\n    You'll be alive soon... Somebody is creating you! \n\n\n\n".colorize(:red)
sleep(3)
puts """
    It has been decided that you will be an Australian.
    You'll be born in the East Cost where the sun shines
    and skies are blue\n\n\n"""
sleep(4)
puts"""
    The Creator hasn't decided one thing yet though.
    Whether you'd be an indigenous Australian or not\n\n\n\n
"""
sleep(2)
puts "    Press any key to choose your fate or 'Q' to quit".colorize(:light_blue)

continue_or_quit

system "cls"
creator_at_work
puts "    Press any key to face Bindi's challenges or 'Q' to quit".colorize(:light_blue)
continue_or_quit

system "cls"

time_begin = Time.now
sleep(1)

system "Ruby map.rb"

system "Ruby lockpick.rb"

system "Ruby jump.rb"

elapsed_time = time_begin - Time.now

system "Ruby final.rb"
system "cls"

puts"\n\n\n\n                        Enter your email"
contact = gets.chomp

puts "\n\n                        Enter your name"
your_name = gets.chomp

puts "\n\n                     Enter amount to donate "
donation = gets.chomp.to_i

Donor.new(your_name, donation, contact, elapsed_time)
leaderboard = File.open("leaderboard.txt", 'a+')
Donor.all.each do |donor|
    puts "\n\n\n"
    puts " #{donor.name.capitalize}".colorize(:green) + " just donated " + "$#{donor.donation_amount}".colorize(:green) + "-- and took" + " #{donor.time.round * -1}".colorize(:red) + " secs to complete BINDI"
    leaderboard.write("\n#{donor.name.capitalize} - Donation: $#{donor.donation_amount} - Time: #{donor.time.round * -1}\n")
end

leaderboard.rewind
puts "\n\n\n                           LEADERBOARD\n".colorize(:green)
puts "   *".colorize(:green) * 16
puts leaderboard.read
# sorting = []
# sorting = leaderboard.read.split(" - ")
# print sorting
puts "\n\n\n\n                     Press any key to Exit"
continue_or_quit
introduction
puts "\n\n\n\n                    THANKS FOR CLOSING THE GAP"
sleep(4)
system "cls"
