# Asteroid Authenticator
A Two-Factor auth app for [AsteroidOS](http://asteroidos.org/)

### Requirements
Proper time set (including the time zone)
> R1: The prover (e.g., token, soft token) and verifier (authentication
> or validation server) MUST know or be able to derive the current
> Unix time (i.e., the number of seconds elapsed since midnight UTC
> of January 1, 1970) for OTP generation.  See [UT] for a more
> detailed definition of the commonly known "Unix time".  The
> precision of the time used by the prover affects how often the
> clock synchronization should be done; see Section 6.

### Bulding
```
mkdir build
cd build
qmake ..
make
```

### Acknowledgements
TOTP code based on https://github.com/RavuAlHemio/cpptotp
