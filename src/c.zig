const c = @cImport({
    @cInclude("secp256k1.h");
    @cInclude("secp256k1_recovery.h");
    @cInclude("secp256k1_extrakeys.h");
    @cInclude("secp256k1_schnorrsig.h");
});

pub const secp256k1_context = c.secp256k1_context;
pub const secp256k1_pubkey = c.secp256k1_pubkey;
pub const secp256k1_ecdsa_signature = c.secp256k1_ecdsa_signature;
pub const secp256k1_ecdsa_recoverable_signature = c.secp256k1_ecdsa_recoverable_signature;

pub const secp256k1_context_create = c.secp256k1_context_create;
pub const secp256k1_context_destroy = c.secp256k1_context_destroy;
pub const secp256k1_context_randomize = c.secp256k1_context_randomize;
pub const secp256k1_ecdsa_sign = c.secp256k1_ecdsa_sign;
pub const secp256k1_ecdsa_verify = c.secp256k1_ecdsa_verify;
pub const secp256k1_ec_pubkey_create = c.secp256k1_ec_pubkey_create;
pub const secp256k1_ec_pubkey_serialize = c.secp256k1_ec_pubkey_serialize;
pub const secp256k1_ec_pubkey_parse = c.secp256k1_ec_pubkey_parse;
pub const secp256k1_ecdsa_signature_serialize_der = c.secp256k1_ecdsa_signature_serialize_der;
pub const secp256k1_ecdsa_signature_parse_der = c.secp256k1_ecdsa_signature_parse_der;
pub const secp256k1_ecdsa_signature_serialize_compact = c.secp256k1_ecdsa_signature_serialize_compact;
pub const secp256k1_ecdsa_signature_parse_compact = c.secp256k1_ecdsa_signature_parse_compact;

pub const secp256k1_ecdsa_recoverable_signature_parse_compact = c.secp256k1_ecdsa_recoverable_signature_parse_compact;
pub const secp256k1_ecdsa_recoverable_signature_serialize_compact = c.secp256k1_ecdsa_recoverable_signature_serialize_compact;
pub const secp256k1_ecdsa_sign_recoverable = c.secp256k1_ecdsa_sign_recoverable;
pub const secp256k1_ecdsa_recover = c.secp256k1_ecdsa_recover;

pub const SECP256K1_CONTEXT_VERIFY = c.SECP256K1_CONTEXT_VERIFY;
pub const SECP256K1_CONTEXT_SIGN = c.SECP256K1_CONTEXT_SIGN;
pub const SECP256K1_EC_COMPRESSED = c.SECP256K1_EC_COMPRESSED;
pub const SECP256K1_EC_UNCOMPRESSED = c.SECP256K1_EC_UNCOMPRESSED;

// Schnorr signature functions (BIP-340)
pub const secp256k1_xonly_pubkey = c.secp256k1_xonly_pubkey;
pub const secp256k1_keypair = c.secp256k1_keypair;
pub const secp256k1_keypair_create = c.secp256k1_keypair_create;
pub const secp256k1_keypair_sec = c.secp256k1_keypair_sec;
pub const secp256k1_keypair_pub = c.secp256k1_keypair_pub;
pub const secp256k1_keypair_xonly_pub = c.secp256k1_keypair_xonly_pub;
pub const secp256k1_xonly_pubkey_parse = c.secp256k1_xonly_pubkey_parse;
pub const secp256k1_xonly_pubkey_serialize = c.secp256k1_xonly_pubkey_serialize;
pub const secp256k1_xonly_pubkey_from_pubkey = c.secp256k1_xonly_pubkey_from_pubkey;
pub const secp256k1_xonly_pubkey_tweak_add = c.secp256k1_xonly_pubkey_tweak_add;
pub const secp256k1_xonly_pubkey_tweak_add_check = c.secp256k1_xonly_pubkey_tweak_add_check;
pub const secp256k1_schnorrsig_sign32 = c.secp256k1_schnorrsig_sign32;
pub const secp256k1_schnorrsig_sign_custom = c.secp256k1_schnorrsig_sign_custom;
pub const secp256k1_schnorrsig_verify = c.secp256k1_schnorrsig_verify;
