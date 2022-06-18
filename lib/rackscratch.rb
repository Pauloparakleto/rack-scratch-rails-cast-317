# frozen_string_literal: true

require_relative "rackscratch/version"

module Rackscratch
  class Error < StandardError; end
  # Your code goes here...

  class Greeter
    def call(env)
      # Diff from the epsode 317: must use finish method at the end. Without it, raise 'undefined method to_i for Rack::Response'
      Rack::Response.new('Hello matrix reloader rack response').finish
    end
  end
end
