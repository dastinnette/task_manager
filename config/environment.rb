APP_ROOT = File.expand_path("..", __dir__)

Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file }
