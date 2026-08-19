# gt2fork v0.6b

This is a macOS-focused fork of **GoatTracker 2.75 / 2.76 Stereo** by Jan
Wassermann. See the [original gt2fork README](https://github.com/jansalleine/gt2fork/blob/master/README.md)
for the project overview, features, compatibility details, credits and
resources.

## What this fork provides

- Native Apple Silicon editor and command-line utility builds.
- Homebrew `sdl2-compat` integration.
- Native CoreMIDI input support.
- Safer built-in file selection when macOS privacy permissions deny access to a
  directory.
- A locally signed `.app` bundle with the GoatTracker icon and practical file
  navigation from the user's home directory.

## Apple Silicon macOS build

The editor and its command-line utilities can be built natively for Apple
Silicon macOS with Homebrew's SDL2 compatibility library. MIDI input uses the
system CoreMIDI framework and does not require an additional MIDI package.

### Requirements

- Apple Silicon Mac
- Xcode Command Line Tools
- [Homebrew](https://brew.sh/)
- Homebrew `sdl2-compat`

Install the command-line build tools and SDL dependency:

```sh
xcode-select --install
brew install sdl2-compat
```

If Xcode Command Line Tools are already installed, `xcode-select` will report
that no installation is necessary.

### Build and run

From the repository root:

```sh
cd src
make -f Makefile.macos -j$(sysctl -n hw.logicalcpu)
cd ..
./macos/gt2fork
```

The resulting executables are written to the `macos` directory:

- `gt2fork` - the editor
- `ins2snd2` - convert GoatTracker instruments to sound-effect data
- `mod2sng` - convert four-channel ProTracker MOD pattern data to a song
- `sngspli2` - split and deduplicate patterns in three-channel songs
- `ss2stereo` - split and deduplicate patterns in six-channel stereo songs

The editor links dynamically to the Homebrew SDL2 compatibility library, so
`sdl2-compat` must remain installed. Press `Alt+D` in gt2fork to select a
CoreMIDI input device.

To create a macOS application bundle:

```sh
cd src
make -f Makefile.macos app
```

The app target creates `macos/GoatTracker2Fork.app` with the GoatTracker icon.
When launched from Finder, it starts in the user's home directory so the
built-in file selector can navigate normally to Desktop and Documents.

Copy or drag `macos/GoatTracker2Fork.app` into `/Applications`, then launch it
from there. This registers the app with macOS. When it first accesses a
protected location such as Desktop or Documents, macOS will ask whether to
allow access; approve the prompt so the built-in file selector can use that
folder.

To build only the editor, use:

```sh
cd src
make -f Makefile.macos editor
```

To remove the generated editor and object files:

```sh
cd src
make -f Makefile.macos clean-macos
```

## License

This project is licensed under the [GNU General Public License version 2](LICENSE).
