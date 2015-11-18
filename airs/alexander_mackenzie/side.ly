\version "2.18.2"

\include "config.ily"
\include "notes.side.ily"

\score {
    \new PipeBandDrumStaff {
        \global
        <<
			{
				\repeat volta 2 { \part \line \break } \break
				\part \line \bar "||" \break
				\part \line \bar "|."
			}
			{
				\snareA s8

				\snareBA s8
				\snareA s8
			}
		>>
	}
	\header {
		title = \title
		meter = \meter
		instrument = \instrumentSide
		composer = \composerSide
	}
}