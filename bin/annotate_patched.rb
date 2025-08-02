# bin/annotate_patched.rb
unless File.respond_to?(:exists?)
  class << File
    alias_method :exists?, :exist?
  end
end

unless defined?(Fixnum)
  Fixnum = Integer
end
unless defined?(Bignum)
  Bignum = Integer
end

load Gem.bin_path('annotate', 'annotate')

# bundle exec ruby bin/annotate_patched.rb model