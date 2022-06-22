# frozen_string_literal: true

require 'erb'
require_relative 'rackscratch/version'
require 'byebug'

module Rackscratch
  # To handle exceptions
  class Error < StandardError; end
  # Your code goes here...

  # Diff from the epsode 317: must use finish method at the end. Without it, raise
  # 'undefined method to_i for Rack::Response'
  class Greeter
    attr_reader :request, :params_name

    def self.call(env)
      new(env).response.finish
    end

    def initialize(env)
      @request = Rack::Request.new(env)
      @params_name = request.params['name']
    end

    def response
      case request.path
      when '/' then Rack::Response.new(render('index.html.erb'))
      when '/change'
        Rack::Response.new(params_name, 302) do |response|
          response.set_cookie('greet', params_name)
          response.redirect('/')
        end
      else Rack::Response.new('Not Found', 404)
      end
    end

    def greet_name
      request.cookies['greet'] || 'World'
    end

    def render(template)
      path = File.expand_path("../views/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
    end
  end
end
