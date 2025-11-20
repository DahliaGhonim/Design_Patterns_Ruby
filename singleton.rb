class AppConfig
  private_class_method :new
  undef_method :dup, :clone

  attr_accessor :settings

  @instance_mutex = Mutex.new

  def initialize(environment)
    @settings = { env: environment }
  end

  def self.instance(environment)
    return @instance if @instance

    @instance_mutex.synchronize do
      @instance ||= new(environment)
    end

    @instance
  end

  def [](key)
    @settings[key]
  end
end

# client code

c1 = AppConfig.instance('production')
c2 = c1

c2.settings = { env: 'development' }
puts c1.equal? c2
puts c1.object_id == c2.object_id

# output: true

def test_singleton(environment)
  c = AppConfig.instance(environment)
  puts c.settings
end

process1 = Thread.new { test_singleton('development') }
process2 = Thread.new { test_singleton('production') }

process1.join
process2.join

# output:
# {env: "development"}
# {env: "development"}

# actually none of the 2 threads will create an object,
# the object displayed is the one created before creating both threads

# c3 = c1.clone
# c4 = c1.dup
