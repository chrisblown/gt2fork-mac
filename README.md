# gt2fork v0.6b

Fork of **GoatTracker 2.75 / 2.76 Stereo** by Jan Wassermann

[https://github.com/jansalleine/gt2fork](https://github.com/jansalleine/gt2fork)

- Editor by Lasse Öörni and Jan Wassermann.
- Music playroutines by Lasse Öörni.
- Uses reSID engine by Dag Lem and Leandro Nini.
- Uses reSIDfp distortion / nonlinearity by Antti Lankila and Leandro Nini.
- Uses 6510 crossassembler from Exomizer2 beta by Magnus Lind.
- Uses the SDL2 library.
- Uses the RtMidi library.
- Uses parts of the GoatTracker icon by Antonio Vera.
- Command quick reference by Simon Bennett.
- Patches and further development by Stefan A. Haubenthal, Valerio Cannone,
  Raine M. Ekman, Tero Lindeman, Henrik Paulini and Groepaz.
- Microtonal support by Birgit Jauernig.

Music data for stereo and mono GoatTracker 2 is fully compatible with gt2fork.
This includes song *(\*.SNG)* and instrument *(\*.INS)* datafiles as well as the
C64 player routines.

## Resources

- [GoatTracker 2 on SourceForge.net](http://sourceforge.net/projects/goattracker2)
- [drfiemost reSID GitHub clone](https://github.com/drfiemost/resid)
- [vice-emu (inluding reSID)](https://sourceforge.net/projects/vice-emu/)
- [drfiemost reSIDfp GitHub clone](https://github.com/drfiemost/residfp)
- [sidplay-residfp on SourceForge.net](https://sourceforge.net/projects/sidplay-residfp/)
- [SDL2 project homepage](https://www.libsdl.org/)
- [RtMidi homepage](http://www.music.mcgill.ca/~gary/rtmidi/)

## Features

- Scalable window
- On-the-fly switching between mono *(1SID)* and stereo *(2SID)* mode instead of
  having two executables
- Custom palette now supports GIMP palette file format
- On-the-fly switching between a black and a blue (C64 basic editor style) theme

## Apple Silicon macOS build

The editor can be built natively for Apple Silicon macOS with Homebrew's SDL2
compatibility library. MIDI input uses the system CoreMIDI framework and does
not require an additional MIDI package.

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

The resulting executable is written to `macos/gt2fork`. It links dynamically
to the Homebrew SDL2 compatibility library, so `sdl2-compat` must remain
installed. Press `Alt+D` in gt2fork to select a CoreMIDI input device.

To remove the generated editor and object files:

```sh
cd src
make -f Makefile.macos clean-editor
```

This target builds the gt2fork editor only. The optional command-line tools
continue to use their existing platform-specific Makefiles.

## License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
