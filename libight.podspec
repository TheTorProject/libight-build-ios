Pod::Spec.new do |s|
  s.name = "libight"
  s.version = "0.1.0"
  s.summary = "Network measurement library"
  s.author = "Simone Basso <bassosimone@gmail.com>"
  s.homepage = "https://github.com/TheTorProject/libight"
  s.license = { :type => "BSD", :file => "LICENSE.md" }
  s.source = { :git => "https://github.com/TheTorProject/libight",
               :branch => "master" }
  s.prepare_command = <<-CMD
    ./build.sh
  CMD
  s.platform = :ios, "7.0"
  s.source_files = "dist/include/"
  s.vendored_libraries = "dist/lib/*.a"
end
