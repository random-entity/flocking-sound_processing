# Flocking sound (Processing version)

## What it is

* This is a little piece of audio-visual computer-program (and somewhat an additive synthesizer) with GUI parameter controls (a [Processing](https://processing.org/) sketch that extends on [the classic 'Flocking' example](https://processing.org/examples/flocking.html) written by [Daniel Shiffman](https://thecodingtrain.com/)) in which a swarm of little autonomous agents (called '[Boids](https://en.wikipedia.org/wiki/Boids)' by the original algorithm developer [Craig Reynolds](https://scholar.google.com/citations?user=PJm3IXAAAAAJ&hl=en)) move around flocking and generate sound in real-time.
* The original 'Boid' flocking algorithm is designed by Craig Reynolds in 1986, to simulate the flocking behavior of birds. An implementation of this [artificial life](https://en.wikipedia.org/wiki/Artificial_life) algorithm as a Processing sketch was written by Daniel Shiffman somewhen around 2005~2015 (I guess) for his book '[The Nature of Code](https://natureofcode.com/)'. I added lines of code to let each of these little boids to make some sound, some additional forces to make them sound more interesting, and some GUI parameter controls to mess up the sound.
* I hope this controllable audio-visual experience enabled by artificial life agents lets you to create and listen to some weird sound while being amused by how these simply programmed lives behave in mass, or just help you with your meditation or sleep.

## How it works and how to use

* Mouse drag with left button to add, with right button to remove boids.
* A sine oscillator is attached to each of the boids, and the frequency of the oscillator is some function of the boid's velocity direction (i.e. heading), designed to make more closely aligned individuals to produce more simliar or closely related pitches.
	* In continuous mode, the heading in $[0, 2\pi)$ is mapped into frequency $[\texttt{lowestFreq}, \texttt{octaves} \text{ octaves higher than } \texttt{lowestFreq})$, in logarithmic scale.
	* In discrete mode, the heading range $[0, 2\pi)$ is chopped into equally-lengthed heading-intervals, and each of them maps into some pitch-interval (in 12 equal temperament) relative to `lowestFreq`, up to `octaves` octaves.
		* When `scaleMode` is not 0, the $n$-th heading-interval maps into pitch-interval of $\texttt{scaleMode} \cdot n \hspace{1em} (\text{mod} \hspace{0.5em} \texttt{octaves} \cdot 12)$.
			* Thus, for example `scaleMode = 7` makes the heading-intervals into the circle of fifths, possibly extended to contain more octaves. `scaleMode = 1` will produce the chromatic scale, `scaleMode = 4` will produce something like the circle of thirds, and so on.
			* A property: The number of possible notes within a `scaleMode` will be $\frac{12}{\gcd(12, \texttt{ scaleMode})}$.
				* I find that "dissonant" intervals like `scaleMode = 6` (tritone) might sound 'calmer' than "consonant" `scaleMode = 7` (perfect fifth) when `octaves` is 2 or higher, since the number of possible pitches is much more confined.
		* When `scaleMode` is 0, the $n$-th heading-interval maps into the $n$-th pitch-interval in the Pentatonic scale.
	* How heading-interval index maps into pitch
	* The `drift` parameter controls how much the heading offset from heading-interval center is mapped into microtonal pitch bend.
* For users bored from these boids making the same sound forever when not tweaking parameters, setting the `turnMag` or `curlMag` parameters far from 0 will make them boids to turn and curl, so that their pitches change frequently even when you're sleeping. The `turnMag` parameter controls how much the boids wants to turn left or right relative to its current heading. The `curlMag` controls how much the boids wants to turn left or right relative to its current position relative to the center of the program window.
* The bottom three parameters, `sepWeight`, `aliWeight`, `cohWeight`, controls the 'separation', 'alignment', 'coherence' elements respectively, in the original Boid algorithm and Daniel Shiffman's implementation example code.
* Miscellaneous details:
	* Amplitude of each oscillator decreases as the boid population increases to prevent clipping.
	* Higher frequencies and lesser amplitude so it doesn't get on your nerves.

## YouTube live

- You might watch a random entity publicly [livestreaming on YouTube](https://www.youtube.com/@public_random_entity/streams) playing with this little program, on random time. You must be very lucky if you managed to catch it (the random entity) streaming live.

## Dependencies

- Processing 4.x
- [Sound](https://processing.org/reference/libraries/sound/index.html) core library for Processing
- [ControlP5](https://www.sojamo.de/libraries/controlP5/) GUI library for Processing written by [Andreas Schiegel](https://www.sojamo.de/)

## Maybe add later...

- I feel that the `drift` parameter is not functioning as expected?
- Some LFOs to automatically modulate the parameters even when you're sleeping.
- More types of interesting force fields.
- Let the boids themselves to modulate the parameters even when you're sleeping.
- Alternate versions:
  - Web version of this so everyone can access and play with it.
  - Maybe some Max patch version or a plugin version?

## License

[flocking-sound_processing](https://github.com/random-entity/flocking-sound_processing) by [random-entity](https://github.com/random-entity) is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

[![CC BY-NC-SA 4.0 License](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

## Contact

You are welcome to contact me about this little repository, whether this made you happy or sad.
- Gmail: randomentityemail@gmail.com
- Instagram: https://www.instagram.com/public_random_entities/
