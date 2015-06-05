require 'sassc'
require 'sassc/import_once/version'
require 'sassc/import_once/engine'
require 'sassc/import_once/importer'

module SassC
  module ImportOnce
    extend self
    
    def import_tracker
      Thread.current[:sassc_import_once_tracker] ||= {}
    end
    
    def activate!
      require 'sassc/import_once/activate'
    end
    
  end
end
