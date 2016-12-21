$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "jruby-jolt"

def spec_path
  "#{File.expand_path("../../", __FILE__)}/spec"
end

def fixtures_path
  "#{spec_path}/fixtures"
end

def fixture_path(file)
  fixtures_path + '/' + file
end

def fixture(file)
  File.read(fixture_path(file))
end

def parse_json(json)
  MultiJson.load(json)
end
