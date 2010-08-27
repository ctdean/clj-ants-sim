# Buildfile for example clojure build
# 
# Chris Dean <ctdean@sokitomi.com>

# Buildr.application.options.trace = true

require 'buildr/clojure'

VERSION_NUMBER = "1.0.0"
GROUP = "clj-ants-sim"

repositories.remote << "http://repo1.maven.org/maven2"

repositories.release_to = "file:///tmp"

deps = %w{
    org.clojure:clojure:jar:1.1.0
    org.clojure:clojure-contrib:jar:1.1.0
    org.slf4j:slf4j-simple:jar:1.6.1
    org.slf4j:slf4j-api:jar:1.6.1
}

desc "The Clojure Ants Simulation project"
define "clj-ants-sim" do
  project.version = VERSION_NUMBER
  project.group = GROUP

  compile.with deps

  package( :jar )

  dist = make_dist_task( project, deps )
  desc "Make a distribution"
  task :dist => dist do 
    puts "Created #{dist}"
  end
end

def make_dist_task(project, deps)
  rel_name = "#{project.id}-#{project.version}"
  container = tar( "#{rel_name}-complete.tar.gz" )
  container.path( rel_name ).tap do |tar|
    tar.include( "README.md" )
    tar.include( deps, :path => "lib" )
    tar.include( project.package.name, :path => "lib" )
  end
  container
end
