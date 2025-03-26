# Package

version       = "0.5.0"
author        = "Status Research & Development GmbH"
description   = "DHT based on Eth discv5 implementation"
license       = "MIT"
skipDirs      = @["tests"]

# Dependencies
requires "nim >= 2.0.14 & < 3.0.0"
requires "secp256k1 >= 0.6.0 & < 0.7.0"
requires "protobuf_serialization >= 0.3.0 & < 0.4.0"
requires "nimcrypto >= 0.6.2 & < 0.7.0"
requires "bearssl >= 0.2.5 & < 0.3.0"
requires "chronicles >= 0.10.2 & < 0.11.0"
requires "chronos >= 4.0.3 & < 4.1.0"
# NOT: requires "libp2p >= 1.5.0 & < 2.0.0"
requires "libp2p#036e110a6080fba1a1662c58cfd8c21f9a548021"
# When using codex-dht project with this specific version of nim-libp2p which
# contains the codex codecs, the previous line of >= 1.5.0 & < 2.0.0
# would make the build use the versioned version of libp2p
# resulting in CID decode methods that don't recognize codex CIDs.
# so we pin the specific commit here so we can use a specific commit
# in the application-project to avoid this problem.
requires "metrics >= 0.1.0 & < 0.2.0"
requires "stew >= 0.2.0 & < 0.3.0"
requires "stint >= 0.8.1 & < 0.9.0"
requires "https://github.com/codex-storage/nim-datastore >= 0.2.0 & < 0.3.0"
requires "questionable >= 0.10.15 & < 0.11.0"

task testAll, "Run all test suites":
  exec "nimble install -d -y"
  withDir "tests":
    exec "nimble testAll"

task test, "Run the test suite":
  exec "nimble install -d -y"
  withDir "tests":
    exec "nimble test"

task testPart1, "Run the test suite part 1":
  exec "nimble install -d -y"
  withDir "tests":
    exec "nimble testPart1"

task testPart2, "Run the test suite part 2":
  exec "nimble install -d -y"
  withDir "tests":
    exec "nimble testPart2"
