Gem::Specification.new do |s|
  s.name = "polish-number"
  s.rubyforge_project = "polish-number"
  s.homepage = "http://github.com/wpiekutowski/polish-number"
  s.version = "0.1.1"
  s.authors = ["Wojciech Piekutowski"]
  s.email = "wojciech@piekutowski.net"
  s.files = ['lib/polish_number.rb']
  s.description = s.summary = <<-END
    polish-number has been renamed to polish_number and moved to https://github.com/amberbit/polish_number
  END
  s.has_rdoc = true
  s.extra_rdoc_files = %w{README.rdoc LICENSE COPYING}
  s.rdoc_options << "--title" << "polish-number documentation" <<
                    "--main"  << "README.rdoc" << "-q"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'test-spec'
end
