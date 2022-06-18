class Greeter
    def call(env)
        [200, {}, ['Hello rack']]
    end
  end

run Greeter.new