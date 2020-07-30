# xargo is used to build motoko-rts for wasm32. We need to make a shared Wasm
# library for the RTS (that's what moc-ld supports) but Rust ships wasm32
# libraries (core and std) without PIC relocation model, so we use xargo to make
# PIC versions of core and std.

{ rustPlatform, fetchFromGitHub, lib, python, cmake, llvmPackages, clang, stdenv, darwin }:

rustPlatform.buildRustPackage rec {
  name = "xargo";

  src = fetchFromGitHub {
    owner = "japaric";
    repo = "${name}";
    rev = "16035a7c401262824edcb87e1401fe4b05a5ccc0";
    sha256 = "0m1dg7vwmmlpqp20p219gsm7zbnnii6lik6hc2vvfsdmnygf271l";
    fetchSubmodules = true;
  };

  cargoSha256 = "1pvmgbk6ifd770g0nch21y9w1a9sxj89i8lj4xwv91xfma8r8f3h";

  # nativeBuildInputs = [ python cmake clang ];
  # buildInputs = [ llvmPackages.libclang ] ++
  #  lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];
  # LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  # doCheck = !stdenv.isDarwin;

  meta = with lib; {
    description = "The sysroot manager that lets you build and customize std";
    homepage = "https://github.com/japaric/xargo";
    license = licenses.mit;
    maintainers = [ {
      email = "omer.agacan@dfinity.org";
      github = "osa1";
      githubId = 123123;
      name = "Ömer Sinan Ağacan";
    } ];
    platforms = platforms.unix;
  };
}
