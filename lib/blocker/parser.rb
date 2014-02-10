module Blocker
  class Parser
    attr_accessor :top_dir, :annotation, :blockers

    def initialize(top_dir, annotation=nil)
      @top_dir = Pathname.new(top_dir)
      @annotation = annotation || /# BLOCKER.*https?:\/\/([\S]+?)\/([\S]+)/
      @blockers = Hash.new { |h,k| h[k] = Array.new }
    end

    def parse
      files.each do |fd|
        fd.each do |line|
          next unless match = line.match(annotation)
          site, raw_uri = match.captures
          meth = "extract_#{site.gsub('.', '_')}"
          next unless respond_to?(meth, true)
          if uri = send(meth, raw_uri)
            process(site, uri.gsub(/\/$/, ''))
          end
        end
      end
    end

    private

    def extract_github_com(uri)
      uri
    end

    def files
      Dir.chdir(top_dir) do
        Dir['**/*.rb'].map do |fn|
          File.new(fn)
        end
      end
    end

    def process(site, uri)
      self.blockers[site] << uri
    end
  end
 end
