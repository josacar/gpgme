module GPGME
  class Key
    def self.import(keydata, options) # FIXME: options = {}
      GPGME::Ctx.new(options) do |ctx|
        ctx.import_keys(Data.new(keydata))
        ctx.import_result
      end
    end

    def self.find(secret, keys_or_names = nil, purposes = nil) # FIXME: purposes = []
      secret = (secret == :secret)
      keys_or_names = [""] if keys_or_names.nil? || (keys_or_names.is_a?(Array) && keys_or_names.empty?)
      keys_or_names = [keys_or_names].flatten
      purposes      = [purposes].flatten.compact.uniq

      keys = [] of (Key | Name)
      keys_or_names.each do |key_or_name|
        case key_or_name
        when Key then keys << key_or_name
        when String
          GPGME::Ctx.new do |ctx|
            keys += ctx.keys(key_or_name, secret).select do |k|
              k.usable_for?(purposes)
            end
          end
        end
      end
      keys
    end
  end
end
