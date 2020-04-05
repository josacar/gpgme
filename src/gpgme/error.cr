module GPGME
  class Error < Exception
    def initialize(@error : LibGPGME::Error)
    end
    getter :error

    # Return the error code.
    #
    # The error code indicates the type of an error, or the reason why
    # an operation failed.
    def code
      LibGPGME.gpgme_err_code(@error)
    end
    #
    # Return a description of the error code.
    def message
#FIXME      LibGPGME.gpgme_strerror(@error)
    end

    class General < self; end
    class InvalidValue < self; end
    class UnusablePublicKey < self
      property :keys
    end
    class UnusableSecretKey < self
      property :keys
    end
    class NoData < self; end
    class Conflict < self; end
    class NotImplemented < self; end
    class DecryptFailed < self; end
    class BadPassphrase < self; end
    class Canceled < self; end
    class InvalidEngine < self; end
    class AmbiguousName < self; end
    class WrongKeyUsage < self
      property :key_usage
    end
    class CertificateRevoked < self; end
    class CertificateExpired < self; end
    class NoCRLKnown < self; end
    class NoPolicyMatch < self; end
    class NoSecretKey < self; end
    class MissingCertificate < self; end
    class BadCertificateChain < self; end
    class UnsupportedAlgorithm < self
      property :algorithm
    end
    class BadSignature < self; end
    class NoPublicKey < self; end
    class InvalidVersion < self; end
  end
end
