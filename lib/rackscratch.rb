# frozen_string_literal: true

require_relative "rackscratch/version"

module Rackscratch
  class Error < StandardError; end
  # Your code goes here...

  class Greeter
    def call(env)
        [200, {}, ['Hello rack']]
    end
  end
end
