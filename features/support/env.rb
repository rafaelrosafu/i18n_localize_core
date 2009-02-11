$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'i18n_localize_core'

require 'test/unit/assertions'

require 'test/unit/assertions'

World do |world|
  
  world.extend(Test::Unit::Assertions)
  
  world
end
