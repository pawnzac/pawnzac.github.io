site: _template.html _stories.html _about.html
	perl compile.pl _stories.html > the_ghost_in_the_heart_of_tarven.html
	perl compile.pl _about.html > about.html
	perl compile.pl _plans.html > plans.html
	perl compile.pl _from_dust.html > from_dust.html
	cp the_ghost_in_the_heart_of_tarven.html index.html
