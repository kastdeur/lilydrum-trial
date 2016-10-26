% =================================================	%
% 	Flams, Drags & the sort							%
% =================================================	%
drumgrace = #(define-music-function (parser location notes ) ( ly:music? ) #{
	% Set settings
	\stemUp
	\once \override Beam.positions = #'(2 . 2)
	\once \override DrumStaff.Stem.length = #5
	\override Flag.stroke-style = #"grace"
	\override Score.GraceSpacing #'spacing-increment = #0
	\override Score.Stem #'beamlet-max-length-proportion = #'(0.5 . 0.5)

	% Print notes
	\small \grace $notes

	% Revert back
	\revert Score.Stem #'beamlet-default-length
	\revert Flag.stroke-style
	\stemNeutral
#})


% Flams
flamd =   \drummode { \drumgrace { g8 } }					% Flam right
flamg =   \drummode { \drumgrace { d8 } }					% Flam left
flamddr = \drummode { \drumgrace { g8\startGroup } }		% Flam right with start repeat
flamgdr = \drummode { \drumgrace { d8\startGroup } }		% Flam left	 with start repeat

% Drags
dragd =   \drummode { \drumgrace { g16[ g] } }				% Drag right
dragg =   \drummode { \drumgrace { d16[ d] } }				% Drag left
dragddr = \drummode { \drumgrace { g16[\startGroup g] } } 	% Drag right with start repeat
draggdr = \drummode { \drumgrace { d16[\startGroup d] } } 	% Drag left  with start repeat

% Open Drags
odragd =   \drummode { \drumgrace { g16[ s^"o" g] } }				% Open Drag right
odragg =   \drummode { \drumgrace { d16[ s^"o" d] } }				% Open Drag left
odragddr = \drummode { \drumgrace { g16[\startGroup s^"o" g] } } 	% Open Drag right with start repeat
odraggdr = \drummode { \drumgrace { d16[\startGroup s^"o" d] } } 	% Open Drag left  with start repeat

% Ruff
ruffg =   \drummode { \drumgrace { g16[ d g] } }				% Ruff right
ruffd =   \drummode { \drumgrace { d16[ g d] } }				% Ruff left
ruffgdr = \drummode { \drumgrace { g16[\startGroup d g] } }	% Ruff right with start repeat
ruffddr = \drummode { \drumgrace { d16[\startGroup g d] } }	% Ruff left  with start repeat

% Swiss Ruff
sruffg =   \drummode { \drumgrace { g16[ d d] } }			% Swiss Ruff right
sruffd =   \drummode { \drumgrace { d16[ g g] } }			% Swiss Ruff left
sruffgdr = \drummode { \drumgrace { g16[\startGroup d d] } }	% Swiss Ruff right with start repeat
sruffddr = \drummode { \drumgrace { d16[\startGroup g g] } }	% Swiss Ruff left  with start repeat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Embellishment functions, automatic left or right	%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

autohand = #(define-music-function (parser location note left right) (ly:music? ly:music? ly:music?) #{
	#(newline)
	#(display "Fix autohand function for arbitrary depth")
	
	#(if (string=? (symbol->string (ly:music-property note 'drum-type)) "left-hand")
		#{ $left #}
		#{ $right #})
	% print the note, else it won't show up
	$note
#})

% Flam
flam = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note { \flamg }  { \flamd }
#})
flamdr = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note { \flamgdr }  { \flamddr }
#})

% Drag
drag = #(define-music-function (parser location note) (ly:music?) #{
    \autohand $note \dragg \dragd
#})
dragdr = #(define-music-function (parser location note) (ly:music?) #{
    \autohand $note \draggdr \dragddr
#})
% Open Drag
odrag = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note \odragg \odragd
#})
odragdr = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note \odraggdr \odragddr
#})

% Ruff
ruff = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note \ruffg \ruffd
#})
ruffdr = #(define-music-function (parser location note) (ly:music?) #{
	\autohand $note \ruffgdr \ruffddr
#})

% Swiss Ruff
sruff = #(define-music-function (parser location note) (ly:music?) #{
  	\autohand $note \sruffg \sruffd
#})
sruffdr = #(define-music-function (parser location note) (ly:music?) #{
  	\autohand $note \sruffgdr \sruffddr
#})
