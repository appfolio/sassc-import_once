require 'minitest_helper'
require 'sassc/import_once/activate'
require 'sassc/import_once/test_importer'

module SassC
  class ImportOnceTest < Minitest::Test
    FIXTURES_DIR = File.expand_path('../../fixtures',  __FILE__)

    def test_basic
      assert_compilation_result('basic')
    end

    def test_force_import_first
      assert_compilation_result('force_import_first')
    end

    def test_force_import_last
      assert_compilation_result('force_import_last')
    end

    def test_with_globbing
      assert_compilation_result('with_globbing')
    end

    def test_with_lots_globbing
      assert_compilation_result('with_lots_globbing')
    end

    def test_component
      assert_compilation_result('component')
    end

    private
    
    def assert_compilation_result(fixture_name)
      sass_file = File.join(FIXTURES_DIR, "#{fixture_name}.scss")
      css_file  = File.join(FIXTURES_DIR, "#{fixture_name}.css")
      
      options = {
        style: :expanded,
        filename: sass_file,
        importer: SassC::ImportOnce::TestImporter,
        load_paths: [ FIXTURES_DIR ]
      }
      
      actual_result = SassC::Engine.new(File.read(sass_file), options).render
      expected_result = File.read(css_file)
      assert_equal expected_result, actual_result
    end
  end
end

