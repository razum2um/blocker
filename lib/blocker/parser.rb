module Blocker
  class Parser
    attr_accessor :top_dir, :annotation, :lines

    def initialize(top_dir, annotation=nil)
      @top_dir = top_dir
      @annotation = annotation || /BLOCKER/
      @lines = []
    end

    def parse
      files.each do |fd|
        fd.grep(annotation) do |line|
          process(line)
        end
      end
    end

    private

    def files
      Dir.chdir(top_dir) do
        Dir['**/*.rb']
      end
    end

    def process(line)
      self.lines << line
    end
  end
 end
