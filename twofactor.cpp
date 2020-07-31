#include <twofactor.h>
#include <botan/totp.h>
#include <botan/symkey.h>
#include "key.h"

int TwoFactor::getCode() {
    /* 
     * The code you'll need has to be hardcoded for now. If you get a URL (or
     * decoded QR code), it will likely be in a format like
     * otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example
     * Base32 decode and hex encode the secret, and pop that string into key.h:
     *     char key[] = "3dc6caa4824a6d288767b2331e20b43166cb85d9";
     */
    Botan::TOTP totp(Botan::SymmetricKey(key));
    return totp.generate_totp(std::chrono::system_clock::now());
}
