Pod::Spec.new do |s|
  s.name = "measurement_kit"
  s.version = "0.1.0"
  s.summary = "Network measurement library"
  s.author = "Simone Basso <bassosimone@gmail.com>"
  s.homepage = "https://github.com/measurement-kit"
  s.license = { :type => "BSD", :file => "LICENSE.md" }
  s.source = { :git => "https://github.com/measurement-kit/measurement-kit-build-ios.git",
               :branch => "master",
               :submodules => "true"
              }
  s.prepare_command = <<-CMD
    ./scripts/build.sh
  CMD
  s.platform = :ios, "9.0"
  s.source_files = "measurement-kit/include/measurement-kit/**/*.{hpp,h,cpp}"
  s.vendored_libraries = "*.framework"
end
