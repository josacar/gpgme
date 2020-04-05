module GPGME
  class Ctx
    alias Options = Hash(Symbol,UInt8)

    def self.new(options, &block)
      ctx = build_context(options)
      begin
        yield ctx
      ensure
        LibGPGME.gpgme_release(ctx)
      end
    end

    def self.new(options)
      build_context(options)
    end

    def self.build_context(options : Options)
      context = uninitialized LibGPGME::Context
      rctx = pointerof(context)

      err = LibGPGME.gpgme_new(rctx)
      puts err.to_u8
      exc = GPGME.error_to_exception(err)
      puts exc.class
      raise exc if exc
      ctx = context

      # ctx.protocol      = options[:protocol]      if options[:protocol]
      ctx.use_armor         = options.fetch(:armor, 1_u8).as(UInt8)
      ctx.use_textmode      = options.fetch(:textmode, 1_u8).as(UInt8)
      # ctx.keylist_mode  = options[:keylist_mode]  if options[:keylist_mode]
      # ctx.pinentry_mode = options[:pinentry_mode] if options[:pinentry_mode]
      ctx.offline       = options.fetch(:offline, 1_u8).as(UInt8)

      if options[:password]
        proc = ->pass_function(Int32, Int32, Int32, UInt8, Int32)
        # ctx.set_passphrase_callback(proc, options[:password])
      else
        if options[:passphrase_callback]
          # ctx.set_passphrase_callback(options[:passphrase_callback],
          #   options[:passphrase_callback_value])
        end
      end
     #  if options[:progress_callback]
     #    ctx.set_progress_callback options[:progress_callback],
     #      options[:progress_callback_value]
     #  end
     #  if options[:status_callback]
     #    ctx.set_status_callback options[:status_callback],
     #      options[:status_callback_value]
     #  end
     ctx
    end

    def set_passphrase_callback(passfunc : Proc, hook_value = nil)
      # LibGPGME.gpgme_set_passphrase_cb(self, passfunc, hook_value)
    end

    # alias_method :set_passphrase_cb, :set_passphrase_callback

    private def self.pass_function(pass, uid_hint, passphrase_info, prev_was_bad, fd)
      io = IO::FileDescriptor.new(fd, 'w')
      # io.autoclose = false
      io.puts pass
      io.flush
    end
  end
end
