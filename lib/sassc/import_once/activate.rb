require 'sassc/import_once'

SassC::Engine.send(:prepend, SassC::ImportOnce::Engine)
