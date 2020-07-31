#include <twofactor.h>
#include "libcppotp/otp.h"
#include "libcppotp/bytes.h"

using namespace CppTotp;

std::string normalizedBase32String(const std::string & unnorm)
{
	std::string ret;

	for (char c : unnorm)
	{
		if (c == ' ' || c == '\n' || c == '-')
		{
			// skip separators
		}
		else if (std::islower(c))
		{
			// make uppercase
			char u = std::toupper(c);
			ret.push_back(u);
		}
		else
		{
			ret.push_back(c);
		}
	}

	return ret;
}

int TwoFactor::getCode() {
    /* 
     * The code you'll need has to be hardcoded for now. If you get a URL (or
     * decoded QR code), it will likely be in a format like
     * otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example
     * Base32 decode and hex encode the secret, and add that here:
     *     char key[] = "3dc6caa4824a6d288767b2331e20b43166cb85d9";
     */

    std::string normalizedKey = normalizedBase32String(key);
    Bytes::ByteString qui = Bytes::fromUnpaddedBase32(normalizedKey);
    return totp(qui, time(NULL), 0, 30, 6);
}
