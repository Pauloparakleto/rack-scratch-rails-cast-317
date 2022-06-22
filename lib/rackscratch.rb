# frozen_string_literal: true
require 'erb'
require_relative "rackscratch/version"
require 'byebug'

module Rackscratch
  class Error < StandardError; end
  # Your code goes here...

  # Diff from the epsode 317: must use finish method at the end. Without it, raise 'undefined method to_i for Rack::Response'
  class Greeter
    def call(env)
      @request = Rack::Request.new(env)
      case @request.path
        when '/' then Rack::Response.new(render('index.html.erb')).finish
        when '/change'
          Rack::Response.new(@request.params['name'], 302) do |response|
            response.set_cookie('greet', @request.params['name'])
            response.redirect('/')
          end.finish
        else Rack::Response.new('Not Found', 404).finish
      end
    end

    def greet_name
      @request.cookies['greet'] || 'World'
    end

    def render(template)
      path = File.expand_path("../views/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
    end
  end
end
