require 'hashie'

class Jolt::SpecStore < Hash
  include Hashie::Extensions::MergeInitializer
  include Hashie::Extensions::IndifferentAccess
end
