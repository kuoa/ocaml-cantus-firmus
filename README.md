# Cantus-firmus
In music, a cantus firmus ("fixed song") is a pre-existing melody forming the basis of a polyphonic composition.

Using **cantus-firmus** you can generate a polyphonic composition from a monophonic .mid/.midi.
The behaviour is not deterministic, so you may launch the algorithm on the same input and you will get different results.
    
Some sample tracks are available in the **tracks** folder containing the tag **#original**.


### Requirements
You will need the following libraries:

* [OCaml][] >= 3.12.1

[OCaml]: http://caml.inria.fr/ocaml/release.en.html

### Compilation

To compile **cantus-firmus**, execute

   	$ make 
    
### Usage
    $ ./cantus_firmus track.mid      Create a cantus firmus for track.mid
	$ make clean                     Clean the project
	
### Example
 	./cantus_firmus track.mid will generate two files
 	    - input_track-1.mid          A clean version of track.mid with a different tempo
 	    - output_track-1.mid         A polyphonic version of track.mid resting on input_track-1.mid
 	
