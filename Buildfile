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

  # package( :jar ).merge( deps )
  package( :jar )
end

task :dist do 
end


