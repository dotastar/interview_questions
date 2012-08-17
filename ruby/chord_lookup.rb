# For this challenge, your task is to write a program that takes a musical chord 
# name from input (like Gm7) and outputs the notes found in that chord (G A# D 
# F). If you're no musician, don't worry -- the progress is quite simple. The 
# first thing you need to know about is the 12 notes of the chromatic scale:
#
#                       C C# D D# E F F# G G# A A# B
#
#The intervals between two notes is expressed in semitones. For example, there 
#are three semitones between the D and the F on this scale. Next, you'll need to
#know about the different kinds of chords themselves:
#
# chord  symbol    tones
# major  (nothing) [0, 4, 7]
# minor  m         [0, 3, 7]
# dom.   7th  7    [0, 4, 7, 10]
# minor  7th m7    [0, 3, 7, 10]
# major  7th maj7  [0, 4, 7, 11]
#
# To find out the notes in a chord, take the base note, then select the tones 
# from the chromatic scale relative to the numbers in the list of tone 
# intervals. For example, for F7, we look up the chord
#
# 7 → dom. 7th → [0, 4, 7, 10]
#
# Then we step [0, 4, 7, 10] semitones up from F in the scale, wrapping if 
# necessary:
#
# [F+0, F+4, F+7, F+10] → [F, A, C, D#]
#
# Those are the notes in our chord.
# http://www.reddit.com/r/dailyprogrammer/comments/y0z3y/8102012_challenge_87_intermediate_chord_lookup/
class Chord
  def initialize(chord_name)
    @progression = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    @chord_types = [ 
      {'reg' => /^[A-Z]\#?$/,     'tones' => [0, 4, 7]},
      {'reg' => /^[A-Z]\#?m$/,    'tones' => [0, 3, 7]},
      {'reg' => /^[A-Z]\#?7$/,    'tones' => [0, 4, 7, 10]},
      {'reg' => /^[A-Z]\#?m7$/,   'tones' => [0, 3, 7, 10]},
      {'reg' => /^[A-Z]\#?maj7$/, 'tones' => [0, 4, 7, 11]}
    ]

    @chord_name = chord_name
  end

  def chords(chord_name = nil)
    chords = []
    tones = tones(chord_name)

    base_note = base_note(chord_name)
    start_index = @progression.index(base_note)
    for tone in tones
      chords.push(@progression[(start_index + tone) % @progression.length])
    end

    return chords
  end

  def base_note(chord_name = nil)
    return /^[A-Z]\#?/.match(chord_name || @chord_name)[0]
  end

  def tones(chord_name = nil)
    for type in @chord_types
      if type['reg'] =~ (chord_name || @chord_name)
        return type['tones']
      end
    end

    return []
  end
end

p Chord.new('Gm7').chords
p Chord.new('F7').chords