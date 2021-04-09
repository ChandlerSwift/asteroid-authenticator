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

You may want `ntp` to keep your clock synced. At one point, AsteroidOS shipped
with an ntp client configured, but it looks like that is no longer the case.
AsteroidOS doesn't seem to have an NTP client in its repos either (as of
2021-04-08), but I've built it; you can get it from the repos at
https://home.chandlerswift.com/asteroid/ -- just update
`/etc/opkg/base-feeds.conf` to point at my repos, `opkg update`, and
`opkg install ntp`.

### Building
```
mkdir build
cd build
qmake ..
make
```

### Acknowledgements
TOTP code based on https://github.com/RavuAlHemio/cpptotp
