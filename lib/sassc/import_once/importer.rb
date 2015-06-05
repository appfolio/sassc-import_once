module SassC
  module ImportOnce
    module Importer
      
      def imports(path, parent_path)
        puts "imports\t#{path} #{parent_path}"
        path, force_import = handle_force_import(path)
        reject_already_imported_imports(super(path, parent_path), force_import)
      end

      private
      
      def handle_force_import(path)
        if path.end_with?("!")
          [path[0...-1], true]
        else
          [path, false]
        end
      end

      def reject_already_imported_imports(imports, force_import)
        return imports unless imports
        
        imports = [ imports ] unless imports.is_a?(Enumerable)
        imports.reject do |import|
          reject = reject_already_imported_import(import, force_import)
          puts "\t#{import.path} => #{reject}"
          reject
          # if reject
          #   import = SassC::Importer::Import.new(import.path, source: "")
          # end
          #
          # import
        end
      rescue => e
        puts e
        []
      end

      def reject_already_imported_import(import, force_import)
        return true unless import
        return true if !force_import && imported?(import)

        imported!(import)
        false
      end
      
      def tracker
        SassC::ImportOnce.import_tracker[options[:filename]] ||= Set.new
      end
      
      def import_tracker_key(import)
        import.path
      end
      
      def imported?(import)
        tracker.include?(import_tracker_key(import))
      end
      
      def imported!(import)
        tracker << import_tracker_key(import)
      end
      
    end
  end
end