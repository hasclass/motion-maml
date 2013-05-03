require 'motion-require'

Motion::Require.all(Dir.glob(File.expand_path('../motion-maml/**/*.rb', __FILE__)))