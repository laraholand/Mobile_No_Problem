#!/data/data/com.termux/files/usr/bin/sh
# Minimal Flutter shim for Termux / LSP

# Set FLUTTER_ROOT to the root of this SDK
FLUTTER_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export FLUTTER_ROOT

# Add Dart SDK to PATH
export PATH="$FLUTTER_ROOT/bin/cache/dart-sdk/bin:$PATH"

# Proxy commands to Dart pub or analysis_server
if [ "$1" = "pub" ]; then
  shift
  exec dart "$FLUTTER_ROOT/bin/cache/dart-sdk/bin/snapshots/pub.dart.snapshot" "$@"
elif [ "$1" = "language-server" ]; then
  shift
  exec dart "$FLUTTER_ROOT/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot" --lsp "$@"
else
  echo "Minimal Flutter Shim: Only 'pub' or 'language-server' commands supported"
  exit 1
fi