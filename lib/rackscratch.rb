# frozen_string_literal: true
require 'erb'
require_relative "rackscratch/version"

module Rackscratch
  class Error < StandardError; end
  # Your code goes here...

  class Greeter
    def call(env)
      # Diff from the epsode 317: must use finish method at the end. Without it, raise 'undefined method to_i for Rack::Response'
      Rack::Response.new(render('index.html.erb')).finish
    end

    def render(template)
      path = File.expand_path("../views/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
    end
  end
end
