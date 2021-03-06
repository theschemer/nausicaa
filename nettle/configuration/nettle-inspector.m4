dnl (foreign crypto nettle sizeof) --
dnl
dnl Part of: Nausicaa
dnl Contents: foreign library inspection generation
dnl Date: Mon Mar 29, 2010
dnl
dnl Abstract
dnl
dnl
dnl
dnl Copyright (c) 2010 Marco Maggi <marco.maggi-ipsu@poste.it>
dnl
dnl This program is free software:  you can redistribute it and/or modify
dnl it under the terms of the  GNU General Public License as published by
dnl the Free Software Foundation, either version 3 of the License, or (at
dnl your option) any later version.
dnl
dnl This program is  distributed in the hope that it  will be useful, but
dnl WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
dnl MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
dnl General Public License for more details.
dnl
dnl You should  have received  a copy of  the GNU General  Public License
dnl along with this program.  If not, see <http://www.gnu.org/licenses/>.
dnl

AC_DEFUN([NAUSICAA_NETTLE],[


dnl Preprocessor symbols: AES symmetric cipher
NAUSICAA_DEFINE_VALUE([AES_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([AES_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([AES_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([AES_KEY_SIZE])

dnl Struct inspection: aes_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([AES_CTX],[struct aes_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([AES_CTX_KEYS],[struct aes_ctx],[keys])
NAUSICAA_INSPECT_FIELD_TYPE([AES_CTX_NROUNDS],[struct aes_ctx],[nrounds],[unsigned-int])

dnl Preprocessor symbols: arcfour symmetric cipher
NAUSICAA_DEFINE_VALUE([ARCFOUR_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([ARCFOUR_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([ARCFOUR_KEY_SIZE])

dnl Struct inspection: arcfour_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([ARCFOUR_CTX],[struct arcfour_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([ARCFOUR_CTX_S],[struct arcfour_ctx],[S])
NAUSICAA_INSPECT_FIELD_TYPE([ARCFOUR_CTX_I],[struct arcfour_ctx],[i],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([ARCFOUR_CTX_J],[struct arcfour_ctx],[j],[unsigned-int])

dnl Preprocessor symbols: arctwo symmetric cipher
NAUSICAA_DEFINE_VALUE([ARCTWO_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([ARCTWO_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([ARCTWO_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([ARCTWO_KEY_SIZE])

dnl Struct inspection: arctwo_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([ARCTWO_CTX],[struct arctwo_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([ARCTWO_CTX_S],[struct arctwo_ctx],[S])

dnl Preprocessor symbols: ASN1 classes
NAUSICAA_DEFINE_VALUE([ASN1_TYPE_CONSTRUCTED])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_UNIVERSAL])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_APPLICATION])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_CONTEXT_SPECIFIC])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_PRIVATE])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_MASK])
NAUSICAA_DEFINE_VALUE([ASN1_CLASS_SHIFT])
NAUSICAA_INSPECT_TYPE([ASN1_TYPE],[enum asn1_type],[signed-int],[#f])

dnl enum asn1_type
NAUSICAA_ENUM_VALUE([ASN1_BOOLEAN])
NAUSICAA_ENUM_VALUE([ASN1_INTEGER])
NAUSICAA_ENUM_VALUE([ASN1_BITSTRING])
NAUSICAA_ENUM_VALUE([ASN1_OCTETSTRING])
NAUSICAA_ENUM_VALUE([ASN1_NULL])
NAUSICAA_ENUM_VALUE([ASN1_IDENTIFIER])
NAUSICAA_ENUM_VALUE([ASN1_REAL])
NAUSICAA_ENUM_VALUE([ASN1_ENUMERATED])
NAUSICAA_ENUM_VALUE([ASN1_UTF8STRING])
NAUSICAA_ENUM_VALUE([ASN1_SEQUENCE])
NAUSICAA_ENUM_VALUE([ASN1_SET])
NAUSICAA_ENUM_VALUE([ASN1_PRINTABLESTRING])
NAUSICAA_ENUM_VALUE([ASN1_TELETEXSTRING])
NAUSICAA_ENUM_VALUE([ASN1_IA5STRING])
NAUSICAA_ENUM_VALUE([ASN1_UTC])
NAUSICAA_ENUM_VALUE([ASN1_UNIVERSALSTRING])
NAUSICAA_ENUM_VALUE([ASN1_BMPSTRING])
NAUSICAA_INSPECT_TYPE([ASN1_ITERATOR_RESULT],[enum asn1_iterator_result],[signed-int],[#f])

dnl enum asn1_iterator_result
NAUSICAA_ENUM_VALUE([ASN1_ITERATOR_ERROR])
NAUSICAA_ENUM_VALUE([ASN1_ITERATOR_PRIMITIVE])
NAUSICAA_ENUM_VALUE([ASN1_ITERATOR_CONSTRUCTED])
NAUSICAA_ENUM_VALUE([ASN1_ITERATOR_END])

dnl Struct inspection: asn1_der_iterator
NAUSICAA_INSPECT_STRUCT_TYPE([ASN1_DER_ITERATOR],[struct asn1_der_iterator],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_BUFFER_LENGTH],[struct asn1_der_iterator],[buffer_length],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_BUFFER],[struct asn1_der_iterator],[buffer],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_POS],[struct asn1_der_iterator],[pos],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_TYPE],[struct asn1_der_iterator],[type],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_LENGTH],[struct asn1_der_iterator],[length],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([ASN1_DER_ITERATOR_DATA],[struct asn1_der_iterator],[data],[pointer])

dnl Struct inspection: base16_decode_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([BASE16_DECODE_CTX],[struct base16_decode_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([BASE16_DECODE_CTX_WORD],[struct base16_decode_ctx],[word],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([BASE16_DECODE_CTX_BITS],[struct base16_decode_ctx],[bits],[unsigned-int])

dnl Preprocessor symbols: base64 constants
NAUSICAA_DEFINE_VALUE([BASE64_BINARY_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([BASE64_TEXT_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([BASE64_ENCODE_FINAL_LENGTH])

dnl Struct inspection: base64_encode_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([BASE64_ENCODE_CTX],[struct base64_encode_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([BASE64_ENCODE_CTX_WORD],[struct base64_encode_ctx],[word],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([BASE64_ENCODE_CTX_BITS],[struct base64_encode_ctx],[bits],[unsigned-int])

dnl Struct inspection: base64_decode_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([BASE64_DECODE_CTX],[struct base64_decode_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([BASE64_DECODE_CTX_WORD],[struct base64_decode_ctx],[word],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([BASE64_DECODE_CTX_BITS],[struct base64_decode_ctx],[bits],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([BASE64_DECODE_CTX_PADDING],[struct base64_decode_ctx],[padding],[unsigned-int])

dnl Preprocessor symbols: blowfish symmetric cipher
NAUSICAA_DEFINE_VALUE([BLOWFISH_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([BLOWFISH_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([BLOWFISH_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([BLOWFISH_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([_BLOWFISH_ROUNDS])
NAUSICAA_INSPECT_TYPE([BLOWFISH_ERROR],[enum blowfish_error],[signed-int],[#f])

dnl enum blowfish_error
NAUSICAA_ENUM_VALUE([BLOWFISH_OK])
NAUSICAA_ENUM_VALUE([BLOWFISH_WEAK_KEY])

dnl Struct inspection: blowfish_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([BLOWFISH_CTX],[struct blowfish_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([BLOWFISH_CTX_S],[struct blowfish_ctx],[s])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([BLOWFISH_CTX_P],[struct blowfish_ctx],[p])
NAUSICAA_INSPECT_FIELD_TYPE([BLOWFISH_CTX_STATUS],[struct blowfish_ctx],[status],[signed-int])

dnl Struct inspection: nettle_buffer
NAUSICAA_INSPECT_STRUCT_TYPE([NETTLE_BUFFER],[struct nettle_buffer],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([NETTLE_BUFFER_CONTENTS],[struct nettle_buffer],[contents],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([NETTLE_BUFFER_ALLOC],[struct nettle_buffer],[alloc],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([NETTLE_BUFFER_REALLOC_CTX],[struct nettle_buffer],[realloc_ctx],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([NETTLE_BUFFER_REALLOC],[struct nettle_buffer],[realloc],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([NETTLE_BUFFER_SIZE],[struct nettle_buffer],[size],[unsigned-int])

dnl Preprocessor symbols: cast128 symmetric cipher
NAUSICAA_DEFINE_VALUE([CAST128_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([CAST128_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([CAST128_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([CAST128_KEY_SIZE])

dnl Struct inspection: cast128_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([CAST128_CTX],[struct cast128_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([CAST128_CTX_KEYS],[struct cast128_ctx],[keys])
NAUSICAA_INSPECT_FIELD_TYPE([CAST128_CTX_ROUNDS],[struct cast128_ctx],[rounds],[unsigned-int])

dnl Preprocessor symbols: DES symmetric cipher
NAUSICAA_DEFINE_VALUE([DES_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([DES_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([_DES_KEY_LENGTH])
NAUSICAA_INSPECT_TYPE([DES_ERROR],[enum des_error],[signed-int],[#f])

dnl enum des_error
NAUSICAA_ENUM_VALUE([DES_OK])
NAUSICAA_ENUM_VALUE([DES_BAD_PARITY])
NAUSICAA_ENUM_VALUE([DES_WEAK_KEY])

dnl Struct inspection: des_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([DES_CTX],[struct des_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DES_CTX_KEY],[struct des_ctx],[key])
NAUSICAA_INSPECT_FIELD_TYPE([DES_CTX_STATUS],[struct des_ctx],[status],[signed-int])

dnl Preprocessor symbols: DES3 symmetric cipher
NAUSICAA_DEFINE_VALUE([DES3_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([DES3_BLOCK_SIZE])

dnl Struct inspection: des3_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([DES3_CTX],[struct des3_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DES3_CTX_DES],[struct des3_ctx],[des])
NAUSICAA_INSPECT_FIELD_TYPE([DES3_CTX_STATUS],[struct des3_ctx],[status],[signed-int])

dnl Preprocessor symbols: DSA pubkey cipher
NAUSICAA_DEFINE_VALUE([DSA_MIN_P_BITS])
NAUSICAA_DEFINE_VALUE([DSA_Q_OCTETS])
NAUSICAA_DEFINE_VALUE([DSA_Q_BITS])

dnl Struct inspection: dsa_public_key
NAUSICAA_INSPECT_STRUCT_TYPE([DSA_PUBLIC_KEY],[struct dsa_public_key],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_PUBLIC_KEY_P],[struct dsa_public_key],[p])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_PUBLIC_KEY_Q],[struct dsa_public_key],[q])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_PUBLIC_KEY_G],[struct dsa_public_key],[g])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_PUBLIC_KEY_Y],[struct dsa_public_key],[y])

dnl Struct inspection: dsa_private_key
NAUSICAA_INSPECT_STRUCT_TYPE([DSA_PRIVATE_KEY],[struct dsa_private_key],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_PRIVATE_KEY_X],[struct dsa_private_key],[x])

dnl Struct inspection: dsa_signature
NAUSICAA_INSPECT_STRUCT_TYPE([DSA_SIGNATURE],[struct dsa_signature],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_SIGNATURE_R],[struct dsa_signature],[r])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([DSA_SIGNATURE_S],[struct dsa_signature],[s])

dnl Struct inspection: hmac_md5_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([HMAC_MD5_CTX],[struct hmac_md5_ctx],[#f])

dnl Struct inspection: hmac_sha1_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([HMAC_SHA1_CTX],[struct hmac_sha1_ctx],[#f])

dnl Struct inspection: hmac_sha256_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([HMAC_SHA256_CTX],[struct hmac_sha256_ctx],[#f])

dnl Preprocessor symbols: Knuth random numbers generator
NAUSICAA_DEFINE_VALUE([_KNUTH_LFIB_KK])

dnl Struct inspection: knuth_lfib_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([KNUTH_LFIB_CTX],[struct knuth_lfib_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([KNUTH_LFIB_CTX_X],[struct knuth_lfib_ctx],[x])
NAUSICAA_INSPECT_FIELD_TYPE([KNUTH_LFIB_CTX_INDEX],[struct knuth_lfib_ctx],[index],[unsigned-int])

dnl Preprocessor symbols: MD2 message digest
NAUSICAA_DEFINE_VALUE([MD2_DIGEST_SIZE])
NAUSICAA_DEFINE_VALUE([MD2_DATA_SIZE])

dnl Struct inspection: md2_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([MD2_CTX],[struct md2_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD2_CTX_C],[struct md2_ctx],[C])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD2_CTX_X],[struct md2_ctx],[X])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD2_CTX_BLOCK],[struct md2_ctx],[block])
NAUSICAA_INSPECT_FIELD_TYPE([MD2_CTX_INDEX],[struct md2_ctx],[index],[unsigned-int])

dnl Preprocessor symbols: MD4 message digest
NAUSICAA_DEFINE_VALUE([MD4_DIGEST_SIZE])
NAUSICAA_DEFINE_VALUE([MD4_DATA_SIZE])
NAUSICAA_DEFINE_VALUE([_MD4_DIGEST_LENGTH])

dnl Struct inspection: md4_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([MD4_CTX],[struct md4_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD4_CTX_DIGEST],[struct md4_ctx],[digest])
NAUSICAA_INSPECT_FIELD_TYPE([MD4_CTX_COUNT_L],[struct md4_ctx],[count_l],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([MD4_CTX_COUNT_H],[struct md4_ctx],[count_h],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD4_CTX_BLOCK],[struct md4_ctx],[block])
NAUSICAA_INSPECT_FIELD_TYPE([MD4_CTX_INDEX],[struct md4_ctx],[index],[unsigned-int])

dnl Preprocessor symbols: MD5 message digest
NAUSICAA_DEFINE_VALUE([MD5_DIGEST_SIZE])
NAUSICAA_DEFINE_VALUE([MD5_DATA_SIZE])
NAUSICAA_DEFINE_VALUE([_MD5_DIGEST_LENGTH])

dnl Struct inspection: md5_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([MD5_CTX],[struct md5_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD5_CTX_DIGEST],[struct md5_ctx],[digest])
NAUSICAA_INSPECT_FIELD_TYPE([MD5_CTX_COUNT_L],[struct md5_ctx],[count_l],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([MD5_CTX_COUNT_H],[struct md5_ctx],[count_h],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([MD5_CTX_BLOCK],[struct md5_ctx],[block])
NAUSICAA_INSPECT_FIELD_TYPE([MD5_CTX_INDEX],[struct md5_ctx],[index],[unsigned-int])
NAUSICAA_INSPECT_TYPE([TIME_T],[time_t],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([PGP_LENGTHS],[enum pgp_lengths],[signed-int],[#f])

dnl enum pgp_lengths
NAUSICAA_ENUM_VALUE([PGP_LENGTH_ONE_OCTET])
NAUSICAA_ENUM_VALUE([PGP_LENGTH_TWO_OCTETS])
NAUSICAA_ENUM_VALUE([PGP_LENGTH_FOUR_OCTETS])
NAUSICAA_INSPECT_TYPE([PGP_PUBLIC_KEY_ALGORITHM],[enum pgp_public_key_algorithm],[signed-int],[#f])

dnl enum pgp_public_key_algorithm
NAUSICAA_ENUM_VALUE([PGP_RSA])
NAUSICAA_ENUM_VALUE([PGP_RSA_ENCRYPT])
NAUSICAA_ENUM_VALUE([PGP_RSA_SIGN])
NAUSICAA_ENUM_VALUE([PGP_EL_GAMAL_ENCRYPT])
NAUSICAA_ENUM_VALUE([PGP_DSA])
NAUSICAA_ENUM_VALUE([PGP_EL_GAMAL])
NAUSICAA_INSPECT_TYPE([PGP_SYMMETRIC_ALGORITHM],[enum pgp_symmetric_algorithm],[signed-int],[#f])

dnl enum pgp_symmetric_algorithm
NAUSICAA_ENUM_VALUE([PGP_PLAINTEXT])
NAUSICAA_ENUM_VALUE([PGP_IDEA])
NAUSICAA_ENUM_VALUE([PGP_3DES])
NAUSICAA_ENUM_VALUE([PGP_CAST5])
NAUSICAA_ENUM_VALUE([PGP_BLOWFISH])
NAUSICAA_ENUM_VALUE([PGP_SAFER_SK])
NAUSICAA_ENUM_VALUE([PGP_AES128])
NAUSICAA_ENUM_VALUE([PGP_AES192])
NAUSICAA_ENUM_VALUE([PGP_AES256])
NAUSICAA_INSPECT_TYPE([PGP_COMPRESSION_ALGORITHM],[enum pgp_compression_algorithm],[signed-int],[#f])

dnl enum pgp_compression_algorithm
NAUSICAA_ENUM_VALUE([PGP_UNCOMPRESSED])
NAUSICAA_ENUM_VALUE([PGP_ZIP])
NAUSICAA_ENUM_VALUE([PGP_ZLIB])
NAUSICAA_INSPECT_TYPE([PGP_HASH_ALGORITHM],[enum pgp_hash_algorithm],[signed-int],[#f])

dnl enum pgp_hash_algorithm
NAUSICAA_ENUM_VALUE([PGP_MD5])
NAUSICAA_ENUM_VALUE([PGP_SHA1])
NAUSICAA_ENUM_VALUE([PGP_RIPEMD])
NAUSICAA_ENUM_VALUE([PGP_MD2])
NAUSICAA_ENUM_VALUE([PGP_TIGER192])
NAUSICAA_ENUM_VALUE([PGP_HAVAL])
NAUSICAA_INSPECT_TYPE([PGP_TAG],[enum pgp_tag],[signed-int],[#f])

dnl enum pgp_tag
NAUSICAA_ENUM_VALUE([PGP_TAG_PUBLIC_SESSION_KEY])
NAUSICAA_ENUM_VALUE([PGP_TAG_SIGNATURE])
NAUSICAA_ENUM_VALUE([PGP_TAG_SYMMETRIC_SESSION_KEY])
NAUSICAA_ENUM_VALUE([PGP_TAG_ONE_PASS_SIGNATURE])
NAUSICAA_ENUM_VALUE([PGP_TAG_SECRET_KEY])
NAUSICAA_ENUM_VALUE([PGP_TAG_PUBLIC_KEY])
NAUSICAA_ENUM_VALUE([PGP_TAG_SECRET_SUBKEY])
NAUSICAA_ENUM_VALUE([PGP_TAG_COMPRESSED])
NAUSICAA_ENUM_VALUE([PGP_TAG_ENCRYPTED])
NAUSICAA_ENUM_VALUE([PGP_TAG_MARKER])
NAUSICAA_ENUM_VALUE([PGP_TAG_LITERAL])
NAUSICAA_ENUM_VALUE([PGP_TAG_TRUST])
NAUSICAA_ENUM_VALUE([PGP_TAG_USERID])
NAUSICAA_ENUM_VALUE([PGP_TAG_PUBLIC_SUBKEY])
NAUSICAA_INSPECT_TYPE([PGP_SIGNATURE_TYPE],[enum pgp_signature_type],[signed-int],[#f])

dnl enum pgp_signature_type
NAUSICAA_ENUM_VALUE([PGP_SIGN_BINARY])
NAUSICAA_ENUM_VALUE([PGP_SIGN_TEXT])
NAUSICAA_ENUM_VALUE([PGP_SIGN_STANDALONE])
NAUSICAA_ENUM_VALUE([PGP_SIGN_CERTIFICATION])
NAUSICAA_ENUM_VALUE([PGP_SIGN_CERTIFICATION_PERSONA])
NAUSICAA_ENUM_VALUE([PGP_SIGN_CERTIFICATION_CASUAL])
NAUSICAA_ENUM_VALUE([PGP_SIGN_CERTIFICATION_POSITIVE])
NAUSICAA_ENUM_VALUE([PGP_SIGN_SUBKEY])
NAUSICAA_ENUM_VALUE([PGP_SIGN_KEY])
NAUSICAA_ENUM_VALUE([PGP_SIGN_REVOCATION])
NAUSICAA_ENUM_VALUE([PGP_SIGN_REVOCATION_SUBKEY])
NAUSICAA_ENUM_VALUE([PGP_SIGN_REVOCATION_CERTIFICATE])
NAUSICAA_ENUM_VALUE([PGP_SIGN_TIMESTAMP])
NAUSICAA_INSPECT_TYPE([PGP_SUBPACKET_TAG],[enum pgp_subpacket_tag],[signed-int],[#f])

dnl enum pgp_subpacket_tag
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_CREATION_TIME])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_SIGNATURE_EXPIRATION_TIME])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_EXPORTABLE_CERTIFICATION])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_TRUST_SIGNATURE])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_REGULAR_EXPRESSION])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_REVOCABLE])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_KEY_EXPIRATION_TIME])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PLACEHOLDER])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PREFERRED_SYMMETRIC_ALGORITHMS])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_REVOCATION_KEY])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_ISSUER_KEY_ID])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_NOTATION_DATA])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PREFERRED_HASH_ALGORITHMS])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PREFERRED_COMPRESSION_ALGORITHMS])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_KEY_SERVER_PREFERENCES])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PREFERRED_KEY_SERVER])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_PRIMARY_USER_ID])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_POLICY_URL])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_KEY_FLAGS])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_SIGNERS_USER_ID])
NAUSICAA_ENUM_VALUE([PGP_SUBPACKET_REASON_FOR_REVOCATION])

dnl Preprocessor symbols: RSA pubkey cipher
NAUSICAA_DEFINE_VALUE([RSA_MINIMUM_N_OCTETS])
NAUSICAA_DEFINE_VALUE([RSA_MINIMUM_N_BITS])

dnl Struct inspection: rsa_public_key
NAUSICAA_INSPECT_STRUCT_TYPE([RSA_PUBLIC_KEY],[struct rsa_public_key],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([RSA_PUBLIC_KEY_SIZE],[struct rsa_public_key],[size],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PUBLIC_KEY_N],[struct rsa_public_key],[n])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PUBLIC_KEY_E],[struct rsa_public_key],[e])

dnl Struct inspection: rsa_private_key
NAUSICAA_INSPECT_STRUCT_TYPE([RSA_PRIVATE_KEY],[struct rsa_private_key],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([RSA_PRIVATE_KEY_SIZE],[struct rsa_private_key],[size],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_D],[struct rsa_private_key],[d])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_P],[struct rsa_private_key],[p])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_Q],[struct rsa_private_key],[q])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_A],[struct rsa_private_key],[a])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_B],[struct rsa_private_key],[b])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([RSA_PRIVATE_KEY_C],[struct rsa_private_key],[c])

dnl Preprocessor symbols: serpent symmetric cipher
NAUSICAA_DEFINE_VALUE([SERPENT_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([SERPENT_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([SERPENT_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([SERPENT_MAX_KEY_SIZE])

dnl Struct inspection: serpent_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([SERPENT_CTX],[struct serpent_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([SERPENT_CTX_KEYS],[struct serpent_ctx],[keys])
NAUSICAA_INSPECT_TYPE([SEXP_TYPE],[enum sexp_type],[signed-int],[#f])

dnl enum sexp_type
NAUSICAA_ENUM_VALUE([SEXP_ATOM])
NAUSICAA_ENUM_VALUE([SEXP_LIST])
NAUSICAA_ENUM_VALUE([SEXP_END])

dnl Struct inspection: sexp_iterator
NAUSICAA_INSPECT_STRUCT_TYPE([SEXP_ITERATOR],[struct sexp_iterator],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_LENGTH],[struct sexp_iterator],[length],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_BUFFER],[struct sexp_iterator],[buffer],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_START],[struct sexp_iterator],[start],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_POS],[struct sexp_iterator],[pos],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_LEVEL],[struct sexp_iterator],[level],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_TYPE],[struct sexp_iterator],[type],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_DISPLAY_LENGTH],[struct sexp_iterator],[display_length],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_DISPLAY],[struct sexp_iterator],[display],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_ATOM_LENGTH],[struct sexp_iterator],[atom_length],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SEXP_ITERATOR_ATOM],[struct sexp_iterator],[atom],[pointer])

dnl Preprocessor symbols: SHA1 message digest
NAUSICAA_DEFINE_VALUE([SHA1_DIGEST_SIZE])
NAUSICAA_DEFINE_VALUE([SHA1_DATA_SIZE])
NAUSICAA_DEFINE_VALUE([_SHA1_DIGEST_LENGTH])

dnl Struct inspection: sha1_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([SHA1_CTX],[struct sha1_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([SHA1_CTX_DIGEST],[struct sha1_ctx],[digest])
NAUSICAA_INSPECT_FIELD_TYPE([SHA1_CTX_COUNT_LOW],[struct sha1_ctx],[count_low],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SHA1_CTX_COUNT_HIGH],[struct sha1_ctx],[count_high],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([SHA1_CTX_BLOCK],[struct sha1_ctx],[block])
NAUSICAA_INSPECT_FIELD_TYPE([SHA1_CTX_INDEX],[struct sha1_ctx],[index],[unsigned-int])

dnl Preprocessor symbols: SHA256 message digest
NAUSICAA_DEFINE_VALUE([SHA256_DIGEST_SIZE])
NAUSICAA_DEFINE_VALUE([SHA256_DATA_SIZE])
NAUSICAA_DEFINE_VALUE([_SHA256_DIGEST_LENGTH])

dnl Struct inspection: sha256_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([SHA256_CTX],[struct sha256_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([SHA256_CTX_STATE],[struct sha256_ctx],[state])
NAUSICAA_INSPECT_FIELD_TYPE([SHA256_CTX_COUNT_LOW],[struct sha256_ctx],[count_low],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([SHA256_CTX_COUNT_HIGH],[struct sha256_ctx],[count_high],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([SHA256_CTX_BLOCK],[struct sha256_ctx],[block])
NAUSICAA_INSPECT_FIELD_TYPE([SHA256_CTX_INDEX],[struct sha256_ctx],[index],[unsigned-int])

dnl Preprocessor symbols: twofish symmetric cipher
NAUSICAA_DEFINE_VALUE([TWOFISH_BLOCK_SIZE])
NAUSICAA_DEFINE_VALUE([TWOFISH_MIN_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([TWOFISH_MAX_KEY_SIZE])
NAUSICAA_DEFINE_VALUE([TWOFISH_KEY_SIZE])

dnl Struct inspection: twofish_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([TWOFISH_CTX],[struct twofish_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([TWOFISH_CTX_KEYS],[struct twofish_ctx],[keys])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([TWOFISH_CTX_S_BOX],[struct twofish_ctx],[s_box])
NAUSICAA_INSPECT_TYPE([YARROW_POOL_ID],[enum yarrow_pool_id],[signed-int],[#f])

dnl enum yarrow_pool_id
NAUSICAA_ENUM_VALUE([YARROW_FAST])
NAUSICAA_ENUM_VALUE([YARROW_SLOW])
NAUSICAA_ENUM_VALUE([YARROW256_SEED_FILE_SIZE])
NAUSICAA_ENUM_VALUE([YARROW_KEY_EVENT_BUFFER])

dnl Struct inspection: yarrow_source
NAUSICAA_INSPECT_STRUCT_TYPE([YARROW_SOURCE],[struct yarrow_source],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([YARROW_SOURCE_ESTIMATE],[struct yarrow_source],[estimate])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW_SOURCE_NEXT],[struct yarrow_source],[next],[signed-int])

dnl Struct inspection: yarrow256_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([YARROW256_CTX],[struct yarrow256_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([YARROW256_CTX_POOLS],[struct yarrow256_ctx],[pools])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW256_CTX_SEEDED],[struct yarrow256_ctx],[seeded],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([YARROW256_CTX_KEY],[struct yarrow256_ctx],[key])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([YARROW256_CTX_COUNTER],[struct yarrow256_ctx],[counter])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW256_CTX_NSOURCES],[struct yarrow256_ctx],[nsources],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW256_CTX_SOURCES],[struct yarrow256_ctx],[sources],[pointer])

dnl Struct inspection: yarrow_key_event_ctx
NAUSICAA_INSPECT_STRUCT_TYPE([YARROW_KEY_EVENT_CTX],[struct yarrow_key_event_ctx],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW_KEY_EVENT_CTX_INDEX],[struct yarrow_key_event_ctx],[index],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([YARROW_KEY_EVENT_CTX_CHARS],[struct yarrow_key_event_ctx],[chars])
NAUSICAA_INSPECT_FIELD_TYPE([YARROW_KEY_EVENT_CTX_PREVIOUS],[struct yarrow_key_event_ctx],[previous],[unsigned-int])
NAU_DS_WITH_OPTION([NETTLE_SHARED_OBJECT],[nettle-shared-object],[libnettle.so],
  [Nettle shared library file],[select Nettle shared library file])
NAU_DS_WITH_OPTION([HOGWEED_SHARED_OBJECT],[hogweed-shared-object],[libhogweed.so],
  [Hogweed shared library file],[select Hogweed shared library file])


])


dnl end of file
