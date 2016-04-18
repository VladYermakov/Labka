require "docopt"
require "active_support/inflector"

doc = <<DOCOPT
Models generator.

Usage:
  #{__FILE__} <name> [<opts>...]
  

Options:
  -h --help		Show this message

DOCOPT

begin
	arguments = Docopt::docopt(doc)
rescue Docopt::Exit => e
	puts e.message
	exit
end

name = arguments["<name>"]
parts = name.split('_')
cc_name = parts.inject("") {|x, y| x + y.capitalize}

$stdout = File.open('./app/models/' + name + '.rb', 'w')

system "mkdir \"./app/views/#{name.pluralize}\""

puts "class #{cc_name}"
puts "end"
