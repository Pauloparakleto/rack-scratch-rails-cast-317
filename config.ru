require 'rackscratch'

# The default cooldonw is ser to 10, change it to 0
use Rack::Reloader, 0

PUBLIC_DIRETORY = Rack::File.new('public')
PUBLIC_SCRIPTS = Rack::File.new('scripts')

run Rack::Cascade.new([PUBLIC_DIRETORY, PUBLIC_SCRIPTS, Rackscratch::Greeter])