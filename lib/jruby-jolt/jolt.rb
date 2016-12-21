require 'java'
require 'jolt-core'
require 'multi_json'

require 'jruby-jolt/namespace'
require 'jruby-jolt/chainr'
require 'jruby-jolt/spec_store'

module Jolt

  @specs = Jolt::SpecStore.new

  class << self
    attr_reader :specs

    def spec(name)
      @specs[name]
    end

    def load_spec_from_file(name, file)
      @specs[name] = Jolt::Chainr.from_spec(MultiJson.load(File.read(file)))
    end

    def load_spec_from_data(name, data)
      @specs[name] = Jolt::Chainr.from_spec(data)
    end

    def load_spec(name, spec)
      case spec
      when String
        load_spec_from_file(name, spec)
      when Hash, Array
        load_spec_from_data(name, spec)
      else
        raise "Invalid spec input. Please provide the file path or parsed JSON data."
      end
    end

    def transform(name, data)
      raise "Spec not found: #{name}" unless @specs[name]
      @specs[name].transform(data)
    end
  end

end
