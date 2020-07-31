# Asteroid Authenticator
A Two-Factor auth app for [AsteroidOS](http://asteroidos.org/)

### Dependencies

Botan (TODO: remove)
```
# install sdk from https://asteroidos.org/wiki/creating-an-asteroid-app/#installsdk
curl https://release.asteroidos.org/nightlies/sdk/oecore-x86_64-armv7vet2hf-neon-toolchain-nodistro.0.sh > install_toolchain.sh
chmod +x install_toolchain.sh
./install_toolchain.sh
# If you don't want to install as root (or permanently add this to your system),
# you could install to e.g. /tmp/oecore-x86_64/

source /tmp/oecore-x86_64/environment-setup-armv7vet2hf-neon-oe-linux-gnueabi
git clone https://github.com/randombit/botan
cd botan
./configure.py --cpu=arm --cc-bin="$CXX" --ar-command=$AR
make -j16
# This takes an unreasonably long amount of time in one of the `as` steps??
scp libbotan-2.so.15 root@192.168.2.15:/usr/lib/
```

Proper time
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
