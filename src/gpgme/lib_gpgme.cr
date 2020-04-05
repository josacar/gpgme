@[Link("gpgme")]
lib LibGPGME
  # typedef unsigned int gpg_error_t;
  type GPG_Error = LibC::UInt
  # typedef gpg_error_t gpgme_error_t;
  type Error = GPG_Error

  # struct gpgme_context
  # {
  #   DECLARE_LOCK (lock);
  #
  #   /* True if the context was canceled asynchronously.  */
  #   int canceled;
  #
  #   /* The engine info for this context.  */
  #   gpgme_engine_info_t engine_info;
  #
  #   /* The protocol used by this context.  */
  #   gpgme_protocol_t protocol;
  #
  #   /* The running engine process.  */
  #   engine_t engine;
  #
  #   /* Engine's sub protocol.  */
  #   gpgme_protocol_t sub_protocol;
  #
  #   /* True if armor mode should be used.  */
  #   unsigned int use_armor : 1;
  #
  #   /* True if text mode should be used.  */
  #   unsigned int use_textmode : 1;
  #
  #   /* True if offline mode should be used.  */
  #   unsigned int offline : 1;
  #
  #   /* True if a status callback shall be called for nearly all status
  #    * lines.  */
  #   unsigned int full_status : 1;
  #
  #   /* The Tofu info has a human readable string which is presented to
  #    * the user in a directly usable format.  By enabling this flag the
  #    * unmodified string, as received form gpg, will be returned.  */
  #   unsigned int raw_description : 1;
  #
  #   /* True if session keys should be exported upon decryption.  */
  #   unsigned int export_session_keys : 1;
  #
  #   /* True if a Pinentry was launched during the last operation.  This
  #    * flag is cleared with each operation.  */
  #   unsigned int redraw_suggested : 1;
  #
  #   /* True if the option --include-key-block shall be passed to gpg.  */
  #   unsigned int include_key_block : 1;
  #
  #   /* True if the option --auto-key-import shall be passed to gpg.  */
  #   unsigned int auto_key_import : 1;
  #
  #   /* True if the option --auto-key-retrieve shall be passed to gpg.  */
  #   unsigned int auto_key_retrieve : 1;
  #
  #   /* Do not use the symmtric encryption passphrase cache.  */
  #   unsigned int no_symkey_cache : 1;
  #
  #   /* Pass --ignore-mdc-error to gpg.  Note that this flag is reset
  #    * after the operation.  */
  #   unsigned int ignore_mdc_error : 1;
  #
  #   /* Pass --expert to gpg edit key. */
  #   unsigned int extended_edit : 1;
  #
  #   /* Flags for keylist mode.  */
  #   gpgme_keylist_mode_t keylist_mode;
  #
  #   /* The current pinentry mode.  */
  #   gpgme_pinentry_mode_t pinentry_mode;
  #
  #   /* Number of certs to be included.  */
  #   unsigned int include_certs;
  #
  #   /* The actual number of keys in SIGNERS, the allocated size of the
  #    * array, and the array with the signing keys.  */
  #   unsigned int signers_len;
  #   unsigned int signers_size;
  #   gpgme_key_t *signers;
  #
  #   /* The signature notations for this context.  */
  #   gpgme_sig_notation_t sig_notations;
  #
  #   /* The sender's addr-spec or NULL.  */
  #   char *sender;
  #
  #   /* The gpg specific override session key or NULL. */
  #   char *override_session_key;
  #
  #   /* The optional request origin.  */
  #   char *request_origin;
  #
  #   /* The optional auto key locate options.  */
  #   char *auto_key_locate;
  #
  #   /* The locale for the pinentry.  */
  #   char *lc_ctype;
  #   char *lc_messages;
  #
  #   /* The optional trust-model override.  */
  #   char *trust_model;
  #
  #   /* The operation data hooked into the context.  */
  #   ctx_op_data_t op_data;
  #
  #   /* The user provided passphrase callback and its hook value.  */
  #   gpgme_passphrase_cb_t passphrase_cb;
  #   void *passphrase_cb_value;
  #
  #   /* The user provided progress callback and its hook value.  */
  #   gpgme_progress_cb_t progress_cb;
  #   void *progress_cb_value;
  #
  #   /* The user provided status callback and its hook value.  */
  #   gpgme_status_cb_t status_cb;
  #   void *status_cb_value;
  #
  #   /* A list of file descriptors in active use by the current
  #      operation.  */
  #   struct fd_table fdt;
  #   struct gpgme_io_cbs io_cbs;
  # };

  struct Context
    # DECLARE_LOCK (lock); FIXME
    canceled : Int32;
    # engine_info : gpgme_engine_info_t
    # protocol : gpgme_protocol_t
    # engine : engine_t
    # sub_protocol : gpgme_protocol_t
    use_armor : LibC::UInt # = 1
    use_textmode : LibC::UInt # = 1
    offline : LibC::UInt # = 1
    full_status : LibC::UInt # = 1
    raw_description : LibC::UInt # = 1
    export_session_keys : LibC::UInt # = 1
    redraw_suggested : LibC::UInt # = 1
    include_key_block : LibC::UInt # = 1
    auto_key_import : LibC::UInt # = 1
    auto_key_retrieve : LibC::UInt # = 1
    no_symkey_cache : LibC::UInt # = 1
    ignore_mdc_error : LibC::UInt # = 1
    extended_edit : LibC::UInt # = 1
    # keylist_mode : gpgme_keylist_mode_t
    # pinentry_mode : gpgme_pinentry_mode_t
    include_certs : LibC::UInt
    signers_len : LibC::UInt
    signers_size : LibC::UInt
    # signers : gpgme_key_t *
    # sig_notations : gpgme_sig_notation_t
    sender : Pointer(LibC::Char)
    override_session_key : Pointer(LibC::Char)
    request_origin : Pointer(LibC::Char)
    auto_key_locate : Pointer(LibC::Char)
    lc_ctype : Pointer(LibC::Char)
    lc_messages : Pointer(LibC::Char)
    trust_model : Pointer(LibC::Char)
    # op_data : ctx_op_data_t
    # passphrase_cb : gpgme_passphrase_cb_t
    passphrase_cb_value : Pointer(Void)
    # progress_cb : gpgme_progress_cb_t
    progress_cb_value : Pointer(Void)
    # status_cb : gpgme_status_cb_t
    status_cb_value : Pointer(Void)
    # struct fd_table fdt;
    # struct gpgme_io_cbs io_cbs;
  end

  # typedef struct gpgme_context *gpgme_ctx_t;
  alias Ctx = Pointer(Context);

  # static VALUE
  # rb_s_gpgme_new (VALUE dummy, VALUE rctx)
  # {
  #   gpgme_ctx_t ctx;
  #   gpgme_error_t err = gpgme_new (&ctx);
  #
  #   if (gpgme_err_code(err) == GPG_ERR_NO_ERROR)
  #     rb_ary_store (rctx, 0, WRAP_GPGME_CTX(ctx));
  #   return LONG2NUM(err);
  # }

  # gpgme_error_t gpgme_new (gpgme_ctx_t *ctx);¬

  fun gpgme_new(ctx: Ctx) : Error

  enum ErrorCode
    GPG_ERR_NO_ERROR = 0
    GPG_ERR_GENERAL = 1
    GPG_ERR_UNKNOWN_PACKET = 2
    GPG_ERR_UNKNOWN_VERSION = 3
    GPG_ERR_PUBKEY_ALGO = 4
    GPG_ERR_DIGEST_ALGO = 5
    GPG_ERR_BAD_PUBKEY = 6
    GPG_ERR_BAD_SECKEY = 7
    GPG_ERR_BAD_SIGNATURE = 8
    GPG_ERR_NO_PUBKEY = 9
    GPG_ERR_CHECKSUM = 10
    GPG_ERR_BAD_PASSPHRASE = 11
    GPG_ERR_CIPHER_ALGO = 12
    GPG_ERR_KEYRING_OPEN = 13
    GPG_ERR_INV_PACKET = 14
    GPG_ERR_INV_ARMOR = 15
    GPG_ERR_NO_USER_ID = 16
    GPG_ERR_NO_SECKEY = 17
    GPG_ERR_WRONG_SECKEY = 18
    GPG_ERR_BAD_KEY = 19
    GPG_ERR_COMPR_ALGO = 20
    GPG_ERR_NO_PRIME = 21
    GPG_ERR_NO_ENCODING_METHOD = 22
    GPG_ERR_NO_ENCRYPTION_SCHEME = 23
    GPG_ERR_NO_SIGNATURE_SCHEME = 24
    GPG_ERR_INV_ATTR = 25
    GPG_ERR_NO_VALUE = 26
    GPG_ERR_NOT_FOUND = 27
    GPG_ERR_VALUE_NOT_FOUND = 28
    GPG_ERR_SYNTAX = 29
    GPG_ERR_BAD_MPI = 30
    GPG_ERR_INV_PASSPHRASE = 31
    GPG_ERR_SIG_CLASS = 32
    GPG_ERR_RESOURCE_LIMIT = 33
    GPG_ERR_INV_KEYRING = 34
    GPG_ERR_TRUSTDB = 35
    GPG_ERR_BAD_CERT = 36
    GPG_ERR_INV_USER_ID = 37
    GPG_ERR_UNEXPECTED = 38
    GPG_ERR_TIME_CONFLICT = 39
    GPG_ERR_KEYSERVER = 40
    GPG_ERR_WRONG_PUBKEY_ALGO = 41
    GPG_ERR_TRIBUTE_TO_D_A = 42
    GPG_ERR_WEAK_KEY = 43
    GPG_ERR_INV_KEYLEN = 44
    GPG_ERR_INV_ARG = 45
    GPG_ERR_BAD_URI = 46
    GPG_ERR_INV_URI = 47
    GPG_ERR_NETWORK = 48
    GPG_ERR_UNKNOWN_HOST = 49
    GPG_ERR_SELFTEST_FAILED = 50
    GPG_ERR_NOT_ENCRYPTED = 51
    GPG_ERR_NOT_PROCESSED = 52
    GPG_ERR_UNUSABLE_PUBKEY = 53
    GPG_ERR_UNUSABLE_SECKEY = 54
    GPG_ERR_INV_VALUE = 55
    GPG_ERR_BAD_CERT_CHAIN = 56
    GPG_ERR_MISSING_CERT = 57
    GPG_ERR_NO_DATA = 58
    GPG_ERR_BUG = 59
    GPG_ERR_NOT_SUPPORTED = 60
    GPG_ERR_INV_OP = 61
    GPG_ERR_TIMEOUT = 62
    GPG_ERR_INTERNAL = 63
    GPG_ERR_EOF_GCRYPT = 64
    GPG_ERR_INV_OBJ = 65
    GPG_ERR_TOO_SHORT = 66
    GPG_ERR_TOO_LARGE = 67
    GPG_ERR_NO_OBJ = 68
    GPG_ERR_NOT_IMPLEMENTED = 69
    GPG_ERR_CONFLICT = 70
    GPG_ERR_INV_CIPHER_MODE = 71
    GPG_ERR_INV_FLAG = 72
    GPG_ERR_INV_HANDLE = 73
    GPG_ERR_TRUNCATED = 74
    GPG_ERR_INCOMPLETE_LINE = 75
    GPG_ERR_INV_RESPONSE = 76
    GPG_ERR_NO_AGENT = 77
    GPG_ERR_AGENT = 78
    GPG_ERR_INV_DATA = 79
    GPG_ERR_ASSUAN_SERVER_FAULT = 80
    GPG_ERR_ASSUAN = 81
    GPG_ERR_INV_SESSION_KEY = 82
    GPG_ERR_INV_SEXP = 83
    GPG_ERR_UNSUPPORTED_ALGORITHM = 84
    GPG_ERR_NO_PIN_ENTRY = 85
    GPG_ERR_PIN_ENTRY = 86
    GPG_ERR_BAD_PIN = 87
    GPG_ERR_INV_NAME = 88
    GPG_ERR_BAD_DATA = 89
    GPG_ERR_INV_PARAMETER = 90
    GPG_ERR_WRONG_CARD = 91
    GPG_ERR_NO_DIRMNGR = 92
    GPG_ERR_DIRMNGR = 93
    GPG_ERR_CERT_REVOKED = 94
    GPG_ERR_NO_CRL_KNOWN = 95
    GPG_ERR_CRL_TOO_OLD = 96
    GPG_ERR_LINE_TOO_LONG = 97
    GPG_ERR_NOT_TRUSTED = 98
    GPG_ERR_CANCELED = 99
    GPG_ERR_BAD_CA_CERT = 100
    GPG_ERR_CERT_EXPIRED = 101
    GPG_ERR_CERT_TOO_YOUNG = 102
    GPG_ERR_UNSUPPORTED_CERT = 103
    GPG_ERR_UNKNOWN_SEXP = 104
    GPG_ERR_UNSUPPORTED_PROTECTION = 105
    GPG_ERR_CORRUPTED_PROTECTION = 106
    GPG_ERR_AMBIGUOUS_NAME = 107
    GPG_ERR_CARD = 108
    GPG_ERR_CARD_RESET = 109
    GPG_ERR_CARD_REMOVED = 110
    GPG_ERR_INV_CARD = 111
    GPG_ERR_CARD_NOT_PRESENT = 112
    GPG_ERR_NO_PKCS15_APP = 113
    GPG_ERR_NOT_CONFIRMED = 114
    GPG_ERR_CONFIGURATION = 115
    GPG_ERR_NO_POLICY_MATCH = 116
    GPG_ERR_INV_INDEX = 117
    GPG_ERR_INV_ID = 118
    GPG_ERR_NO_SCDAEMON = 119
    GPG_ERR_SCDAEMON = 120
    GPG_ERR_UNSUPPORTED_PROTOCOL = 121
    GPG_ERR_BAD_PIN_METHOD = 122
    GPG_ERR_CARD_NOT_INITIALIZED = 123
    GPG_ERR_UNSUPPORTED_OPERATION = 124
    GPG_ERR_WRONG_KEY_USAGE = 125
    GPG_ERR_NOTHING_FOUND = 126
    GPG_ERR_WRONG_BLOB_TYPE = 127
    GPG_ERR_MISSING_VALUE = 128
    GPG_ERR_HARDWARE = 129
    GPG_ERR_PIN_BLOCKED = 130
    GPG_ERR_USE_CONDITIONS = 131
    GPG_ERR_PIN_NOT_SYNCED = 132
    GPG_ERR_INV_CRL = 133
    GPG_ERR_BAD_BER = 134
    GPG_ERR_INV_BER = 135
    GPG_ERR_ELEMENT_NOT_FOUND = 136
    GPG_ERR_IDENTIFIER_NOT_FOUND = 137
    GPG_ERR_INV_TAG = 138
    GPG_ERR_INV_LENGTH = 139
    GPG_ERR_INV_KEYINFO = 140
    GPG_ERR_UNEXPECTED_TAG = 141
    GPG_ERR_NOT_DER_ENCODED = 142
    GPG_ERR_NO_CMS_OBJ = 143
    GPG_ERR_INV_CMS_OBJ = 144
    GPG_ERR_UNKNOWN_CMS_OBJ = 145
    GPG_ERR_UNSUPPORTED_CMS_OBJ = 146
    GPG_ERR_UNSUPPORTED_ENCODING = 147
    GPG_ERR_UNSUPPORTED_CMS_VERSION = 148
    GPG_ERR_UNKNOWN_ALGORITHM = 149
    GPG_ERR_INV_ENGINE = 150
    GPG_ERR_PUBKEY_NOT_TRUSTED = 151
    GPG_ERR_DECRYPT_FAILED = 152
    GPG_ERR_KEY_EXPIRED = 153
    GPG_ERR_SIG_EXPIRED = 154
    GPG_ERR_ENCODING_PROBLEM = 155
    GPG_ERR_INV_STATE = 156
    GPG_ERR_DUP_VALUE = 157
    GPG_ERR_MISSING_ACTION = 158
    GPG_ERR_MODULE_NOT_FOUND = 159
    GPG_ERR_INV_OID_STRING = 160
    GPG_ERR_INV_TIME = 161
    GPG_ERR_INV_CRL_OBJ = 162
    GPG_ERR_UNSUPPORTED_CRL_VERSION = 163
    GPG_ERR_INV_CERT_OBJ = 164
    GPG_ERR_UNKNOWN_NAME = 165
    GPG_ERR_LOCALE_PROBLEM = 166
    GPG_ERR_NOT_LOCKED = 167
    GPG_ERR_PROTOCOL_VIOLATION = 168
    GPG_ERR_INV_MAC = 169
    GPG_ERR_INV_REQUEST = 170
    GPG_ERR_UNKNOWN_EXTN = 171
    GPG_ERR_UNKNOWN_CRIT_EXTN = 172
    GPG_ERR_LOCKED = 173
    GPG_ERR_UNKNOWN_OPTION = 174
    GPG_ERR_UNKNOWN_COMMAND = 175
    GPG_ERR_NOT_OPERATIONAL = 176
    GPG_ERR_NO_PASSPHRASE = 177
    GPG_ERR_NO_PIN = 178
    GPG_ERR_NOT_ENABLED = 179
    GPG_ERR_NO_ENGINE = 180
    GPG_ERR_MISSING_KEY = 181
    GPG_ERR_TOO_MANY = 182
    GPG_ERR_LIMIT_REACHED = 183
    GPG_ERR_NOT_INITIALIZED = 184
    GPG_ERR_MISSING_ISSUER_CERT = 185
    GPG_ERR_NO_KEYSERVER = 186
    GPG_ERR_INV_CURVE = 187
    GPG_ERR_UNKNOWN_CURVE = 188
    GPG_ERR_DUP_KEY = 189
    GPG_ERR_AMBIGUOUS = 190
    GPG_ERR_NO_CRYPT_CTX = 191
    GPG_ERR_WRONG_CRYPT_CTX = 192
    GPG_ERR_BAD_CRYPT_CTX = 193
    GPG_ERR_CRYPT_CTX_CONFLICT = 194
    GPG_ERR_BROKEN_PUBKEY = 195
    GPG_ERR_BROKEN_SECKEY = 196
    GPG_ERR_MAC_ALGO = 197
    GPG_ERR_FULLY_CANCELED = 198
    GPG_ERR_UNFINISHED = 199
    GPG_ERR_BUFFER_TOO_SHORT = 200
    GPG_ERR_SEXP_INV_LEN_SPEC = 201
    GPG_ERR_SEXP_STRING_TOO_LONG = 202
    GPG_ERR_SEXP_UNMATCHED_PAREN = 203
    GPG_ERR_SEXP_NOT_CANONICAL = 204
    GPG_ERR_SEXP_BAD_CHARACTER = 205
    GPG_ERR_SEXP_BAD_QUOTATION = 206
    GPG_ERR_SEXP_ZERO_PREFIX = 207
    GPG_ERR_SEXP_NESTED_DH = 208
    GPG_ERR_SEXP_UNMATCHED_DH = 209
    GPG_ERR_SEXP_UNEXPECTED_PUNC = 210
    GPG_ERR_SEXP_BAD_HEX_CHAR = 211
    GPG_ERR_SEXP_ODD_HEX_NUMBERS = 212
    GPG_ERR_SEXP_BAD_OCT_CHAR = 213
    GPG_ERR_SUBKEYS_EXP_OR_REV = 217
    GPG_ERR_DB_CORRUPTED = 218
    GPG_ERR_SERVER_FAILED = 219
    GPG_ERR_NO_NAME = 220
    GPG_ERR_NO_KEY = 221
    GPG_ERR_LEGACY_KEY = 222
    GPG_ERR_REQUEST_TOO_SHORT = 223
    GPG_ERR_REQUEST_TOO_LONG = 224
    GPG_ERR_OBJ_TERM_STATE = 225
    GPG_ERR_NO_CERT_CHAIN = 226
    GPG_ERR_CERT_TOO_LARGE = 227
    GPG_ERR_INV_RECORD = 228
    GPG_ERR_BAD_MAC = 229
    GPG_ERR_UNEXPECTED_MSG = 230
    GPG_ERR_COMPR_FAILED = 231
    GPG_ERR_WOULD_WRAP = 232
    GPG_ERR_FATAL_ALERT = 233
    GPG_ERR_NO_CIPHER = 234
    GPG_ERR_MISSING_CLIENT_CERT = 235
    GPG_ERR_CLOSE_NOTIFY = 236
    GPG_ERR_TICKET_EXPIRED = 237
    GPG_ERR_BAD_TICKET = 238
    GPG_ERR_UNKNOWN_IDENTITY = 239
    GPG_ERR_BAD_HS_CERT = 240
    GPG_ERR_BAD_HS_CERT_REQ = 241
    GPG_ERR_BAD_HS_CERT_VER = 242
    GPG_ERR_BAD_HS_CHANGE_CIPHER = 243
    GPG_ERR_BAD_HS_CLIENT_HELLO = 244
    GPG_ERR_BAD_HS_SERVER_HELLO = 245
    GPG_ERR_BAD_HS_SERVER_HELLO_DONE = 246
    GPG_ERR_BAD_HS_FINISHED = 247
    GPG_ERR_BAD_HS_SERVER_KEX = 248
    GPG_ERR_BAD_HS_CLIENT_KEX = 249
    GPG_ERR_BOGUS_STRING = 250
    GPG_ERR_FORBIDDEN = 251
    GPG_ERR_KEY_DISABLED = 252
    GPG_ERR_KEY_ON_CARD = 253
    GPG_ERR_INV_LOCK_OBJ = 254
    GPG_ERR_TRUE = 255
    GPG_ERR_FALSE = 256
    GPG_ERR_ASS_GENERAL = 257
    GPG_ERR_ASS_ACCEPT_FAILED = 258
    GPG_ERR_ASS_CONNECT_FAILED = 259
    GPG_ERR_ASS_INV_RESPONSE = 260
    GPG_ERR_ASS_INV_VALUE = 261
    GPG_ERR_ASS_INCOMPLETE_LINE = 262
    GPG_ERR_ASS_LINE_TOO_LONG = 263
    GPG_ERR_ASS_NESTED_COMMANDS = 264
    GPG_ERR_ASS_NO_DATA_CB = 265
    GPG_ERR_ASS_NO_INQUIRE_CB = 266
    GPG_ERR_ASS_NOT_A_SERVER = 267
    GPG_ERR_ASS_NOT_A_CLIENT = 268
    GPG_ERR_ASS_SERVER_START = 269
    GPG_ERR_ASS_READ_ERROR = 270
    GPG_ERR_ASS_WRITE_ERROR = 271
    GPG_ERR_ASS_TOO_MUCH_DATA = 273
    GPG_ERR_ASS_UNEXPECTED_CMD = 274
    GPG_ERR_ASS_UNKNOWN_CMD = 275
    GPG_ERR_ASS_SYNTAX = 276
    GPG_ERR_ASS_CANCELED = 277
    GPG_ERR_ASS_NO_INPUT = 278
    GPG_ERR_ASS_NO_OUTPUT = 279
    GPG_ERR_ASS_PARAMETER = 280
    GPG_ERR_ASS_UNKNOWN_INQUIRE = 281
    GPG_ERR_ENGINE_TOO_OLD = 300
    GPG_ERR_WINDOW_TOO_SMALL = 301
    GPG_ERR_WINDOW_TOO_LARGE = 302
    GPG_ERR_MISSING_ENVVAR = 303
    GPG_ERR_USER_ID_EXISTS = 304
    GPG_ERR_NAME_EXISTS = 305
    GPG_ERR_DUP_NAME = 306
    GPG_ERR_TOO_YOUNG = 307
    GPG_ERR_TOO_OLD = 308
    GPG_ERR_UNKNOWN_FLAG = 309
    GPG_ERR_INV_ORDER = 310
    GPG_ERR_ALREADY_FETCHED = 311
    GPG_ERR_TRY_LATER = 312
    GPG_ERR_SYSTEM_BUG = 666
    GPG_ERR_DNS_UNKNOWN = 711
    GPG_ERR_DNS_SECTION = 712
    GPG_ERR_DNS_ADDRESS = 713
    GPG_ERR_DNS_NO_QUERY = 714
    GPG_ERR_DNS_NO_ANSWER = 715
    GPG_ERR_DNS_CLOSED = 716
    GPG_ERR_DNS_VERIFY = 717
    GPG_ERR_DNS_TIMEOUT = 718
    GPG_ERR_LDAP_GENERAL = 721
    GPG_ERR_LDAP_ATTR_GENERAL = 722
    GPG_ERR_LDAP_NAME_GENERAL = 723
    GPG_ERR_LDAP_SECURITY_GENERAL = 724
    GPG_ERR_LDAP_SERVICE_GENERAL = 725
    GPG_ERR_LDAP_UPDATE_GENERAL = 726
    GPG_ERR_LDAP_E_GENERAL = 727
    GPG_ERR_LDAP_X_GENERAL = 728
    GPG_ERR_LDAP_OTHER_GENERAL = 729
    GPG_ERR_LDAP_X_CONNECTING = 750
    GPG_ERR_LDAP_REFERRAL_LIMIT = 751
    GPG_ERR_LDAP_CLIENT_LOOP = 752
    GPG_ERR_LDAP_NO_RESULTS = 754
    GPG_ERR_LDAP_CONTROL_NOT_FOUND = 755
    GPG_ERR_LDAP_NOT_SUPPORTED = 756
    GPG_ERR_LDAP_CONNECT = 757
    GPG_ERR_LDAP_NO_MEMORY = 758
    GPG_ERR_LDAP_PARAM = 759
    GPG_ERR_LDAP_USER_CANCELLED = 760
    GPG_ERR_LDAP_FILTER = 761
    GPG_ERR_LDAP_AUTH_UNKNOWN = 762
    GPG_ERR_LDAP_TIMEOUT = 763
    GPG_ERR_LDAP_DECODING = 764
    GPG_ERR_LDAP_ENCODING = 765
    GPG_ERR_LDAP_LOCAL = 766
    GPG_ERR_LDAP_SERVER_DOWN = 767
    GPG_ERR_LDAP_SUCCESS = 768
    GPG_ERR_LDAP_OPERATIONS = 769
    GPG_ERR_LDAP_PROTOCOL = 770
    GPG_ERR_LDAP_TIMELIMIT = 771
    GPG_ERR_LDAP_SIZELIMIT = 772
    GPG_ERR_LDAP_COMPARE_FALSE = 773
    GPG_ERR_LDAP_COMPARE_TRUE = 774
    GPG_ERR_LDAP_UNSUPPORTED_AUTH = 775
    GPG_ERR_LDAP_STRONG_AUTH_RQRD = 776
    GPG_ERR_LDAP_PARTIAL_RESULTS = 777
    GPG_ERR_LDAP_REFERRAL = 778
    GPG_ERR_LDAP_ADMINLIMIT = 779
    GPG_ERR_LDAP_UNAVAIL_CRIT_EXTN = 780
    GPG_ERR_LDAP_CONFIDENT_RQRD = 781
    GPG_ERR_LDAP_SASL_BIND_INPROG = 782
    GPG_ERR_LDAP_NO_SUCH_ATTRIBUTE = 784
    GPG_ERR_LDAP_UNDEFINED_TYPE = 785
    GPG_ERR_LDAP_BAD_MATCHING = 786
    GPG_ERR_LDAP_CONST_VIOLATION = 787
    GPG_ERR_LDAP_TYPE_VALUE_EXISTS = 788
    GPG_ERR_LDAP_INV_SYNTAX = 789
    GPG_ERR_LDAP_NO_SUCH_OBJ = 800
    GPG_ERR_LDAP_ALIAS_PROBLEM = 801
    GPG_ERR_LDAP_INV_DN_SYNTAX = 802
    GPG_ERR_LDAP_IS_LEAF = 803
    GPG_ERR_LDAP_ALIAS_DEREF = 804
    GPG_ERR_LDAP_X_PROXY_AUTH_FAIL = 815
    GPG_ERR_LDAP_BAD_AUTH = 816
    GPG_ERR_LDAP_INV_CREDENTIALS = 817
    GPG_ERR_LDAP_INSUFFICIENT_ACC = 818
    GPG_ERR_LDAP_BUSY = 819
    GPG_ERR_LDAP_UNAVAILABLE = 820
    GPG_ERR_LDAP_UNWILL_TO_PERFORM = 821
    GPG_ERR_LDAP_LOOP_DETECT = 822
    GPG_ERR_LDAP_NAMING_VIOLATION = 832
    GPG_ERR_LDAP_OBJ_CLS_VIOLATION = 833
    GPG_ERR_LDAP_NOT_ALLOW_NONLEAF = 834
    GPG_ERR_LDAP_NOT_ALLOW_ON_RDN = 835
    GPG_ERR_LDAP_ALREADY_EXISTS = 836
    GPG_ERR_LDAP_NO_OBJ_CLASS_MODS = 837
    GPG_ERR_LDAP_RESULTS_TOO_LARGE = 838
    GPG_ERR_LDAP_AFFECTS_MULT_DSAS = 839
    GPG_ERR_LDAP_VLV = 844
    GPG_ERR_LDAP_OTHER = 848
    GPG_ERR_LDAP_CUP_RESOURCE_LIMIT = 881
    GPG_ERR_LDAP_CUP_SEC_VIOLATION = 882
    GPG_ERR_LDAP_CUP_INV_DATA = 883
    GPG_ERR_LDAP_CUP_UNSUP_SCHEME = 884
    GPG_ERR_LDAP_CUP_RELOAD = 885
    GPG_ERR_LDAP_CANCELLED = 886
    GPG_ERR_LDAP_NO_SUCH_OPERATION = 887
    GPG_ERR_LDAP_TOO_LATE = 888
    GPG_ERR_LDAP_CANNOT_CANCEL = 889
    GPG_ERR_LDAP_ASSERTION_FAILED = 890
    GPG_ERR_LDAP_PROX_AUTH_DENIED = 891
    GPG_ERR_USER_1 = 1024
    GPG_ERR_USER_2 = 1025
    GPG_ERR_USER_3 = 1026
    GPG_ERR_USER_4 = 1027
    GPG_ERR_USER_5 = 1028
    GPG_ERR_USER_6 = 1029
    GPG_ERR_USER_7 = 1030
    GPG_ERR_USER_8 = 1031
    GPG_ERR_USER_9 = 1032
    GPG_ERR_USER_10 = 1033
    GPG_ERR_USER_11 = 1034
    GPG_ERR_USER_12 = 1035
    GPG_ERR_USER_13 = 1036
    GPG_ERR_USER_14 = 1037
    GPG_ERR_USER_15 = 1038
    GPG_ERR_USER_16 = 1039
    GPG_ERR_MISSING_ERRNO = 16381
    GPG_ERR_UNKNOWN_ERRNO = 16382
    GPG_ERR_EOF = 16383

    GPG_ERR_CODE_DIM = 65536
  end

  # gpgme_err_code_t¬ gpgme_err_code (gpgme_error_t err)
  # typedef gpg_err_code_t gpgme_err_code_t
  fun gpgme_err_code(err: Error) : ErrorCode

  # const char *gpgme_strerror (gpgme_error_t err);
  fun gpgme_strerror(err: Error) : Pointer(LibC::Char)
end
