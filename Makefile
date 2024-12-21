site: _template.html _stories.html _about.html
	perl compile.pl _stories.html > the_ghost_in_the_heart_of_tarven.html
	perl compile.pl _about.html > about.html
	cp the_ghost_in_the_heart_of_tarven.html index.html
