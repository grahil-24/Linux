
-> grep {regex} {filename

- returns a line, where a string matches the regex.

Eg: 
1.  grep ^by sample.txt
		- line starts with the word by

 2. grey seashore$ sample.txt
		 - line ends with the word seashore


3. grep y. sample.txt
		- line should character y in it. 

4. Bracket notation with []
		eg: grep d[iou]g
				- brackets allow us to specify characters found within the bracket.

	- Brackets can also use ranges to increase the amount of characters you want to use.
			Eg: d[a-c]g
				will match patterns like dag, dbg, and dcg
		