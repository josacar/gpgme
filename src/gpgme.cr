require "./gpgme/**"

module GPGME
  GPG_ERR_CODE_MASK = LibGPGME::ErrorCode::GPG_ERR_CODE_DIM - 1

  def self.gpgme_err_code(err : LibGPGME::Error) : LibGPGME::ErrorCode
    # gpg_err_code (gpg_error_t err)
    # {
    #   return (gpg_err_code_t) (err & GPG_ERR_CODE_MASK);
    # }

    # #define GPG_ERR_CODE_MASK   (GPG_ERR_CODE_DIM - 1)

    # result = err & GPGME::GPG_ERR_CODE_MASK.as(UInt16)
    error = err.to_u8 & GPGME::GPG_ERR_CODE_MASK.value

    LibGPGME::ErrorCode.from_value(error)
  end

  def self.error_to_exception(err)
    case GPGME.gpgme_err_code(err)
      # when GPG_ERR_EOF
      #   EOFError.new
      # when GPG_ERR_NO_ERROR
      #   nil
      # when GPG_ERR_GENERAL
      #   Error::General.new(err)
      # when GPG_ERR_ENOMEM
      #   Errno::ENOMEM.new
      # when GPG_ERR_INV_VALUE
      #   Error::InvalidValue.new(err)
      # when GPG_ERR_UNUSABLE_PUBKEY
      #   Error::UnusablePublicKey.new(err)
      # when GPG_ERR_UNUSABLE_SECKEY
      #   Error::UnusableSecretKey.new(err)
      # when GPG_ERR_NO_DATA
      #   Error::NoData.new(err)
      # when GPG_ERR_CONFLICT
      #   Error::Conflict.new(err)
      # when GPG_ERR_NOT_IMPLEMENTED
      #   Error::NotImplemented.new(err)
      # when GPG_ERR_DECRYPT_FAILED
      #   Error::DecryptFailed.new(err)
      # when GPG_ERR_BAD_PASSPHRASE
      #   Error::BadPassphrase.new(err)
      # when GPG_ERR_CANCELED
      #   Error::Canceled.new(err)
      # when GPG_ERR_INV_ENGINE
      #   Error::InvalidEngine.new(err)
      # when GPG_ERR_AMBIGUOUS_NAME
      #   Error::AmbiguousName.new(err)
      # when GPG_ERR_WRONG_KEY_USAGE
      #   Error::WrongKeyUsage.new(err)
      # when GPG_ERR_CERT_REVOKED
      #   Error::CertificateRevoked.new(err)
      # when GPG_ERR_CERT_EXPIRED
      #   Error::CertificateExpired.new(err)
      # when GPG_ERR_NO_CRL_KNOWN
      #   Error::NoCRLKnown.new(err)
      # when GPG_ERR_NO_POLICY_MATCH
      #   Error::NoPolicyMatch.new(err)
      # when GPG_ERR_NO_SECKEY
      #   Error::NoSecretKey.new(err)
      # when GPG_ERR_MISSING_CERT
      #   Error::MissingCertificate.new(err)
      # when GPG_ERR_BAD_CERT_CHAIN
      #   Error::BadCertificateChain.new(err)
      # when GPG_ERR_UNSUPPORTED_ALGORITHM
      #   Error::UnsupportedAlgorithm.new(err)
      # when GPG_ERR_BAD_SIGNATURE
      #   Error::BadSignature.new(err)
      # when GPG_ERR_NO_PUBKEY
      #   Error::NoPublicKey.new(err)
    else
      Error.new(err)
    end
  end
end

puts GPGME::Ctx.new({} of Symbol => UInt8)
