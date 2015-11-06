module SassC
  module ImportOnce
    module Engine
      
      def render
        with_import_once(@options[:filename]) do
          super
        end
      end

      private
      
      def with_import_once(css_filename)
        if @options[:importer] && !@options[:importer].is_a?(SassC::ImportOnce::Importer)
          @options[:importer].send(:prepend, SassC::ImportOnce::Importer)
        end
        
        SassC::ImportOnce.import_tracker[css_filename] = Set.new
        yield
      ensure
        SassC::ImportOnce.import_tracker.delete(css_filename)
      end
      
    end
  end
end