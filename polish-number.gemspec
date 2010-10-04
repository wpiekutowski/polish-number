Gem::Specification.new do |s|
  s.name = "polish-number"
  s.rubyforge_project = "polish-number"
  s.homepage = "http://github.com/wpiekutowski/polish-number"
  s.version = "0.1.0"
  s.authors = ["Wojciech Piekutowski"]
  s.email = "wojciech@piekutowski.net"
  s.files = ['lib/polish_number.rb']
  s.description = s.summary = <<-END
    Translates numbers to Polish words
  END
  s.has_rdoc = true
  s.extra_rdoc_files = %w{README.rdoc LICENSE COPYING}
  s.rdoc_options << "--title" << "polish-number documentation" <<
                    "--main"  << "README.rdoc" << "-q"
end

