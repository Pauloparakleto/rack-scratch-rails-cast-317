require 'rackscratch'

# The default cooldonw is ser to 10, change it to 0
use Rack::Reloader, 0

run Rackscratch::Greeter.new