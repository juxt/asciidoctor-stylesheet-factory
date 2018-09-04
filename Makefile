.PHONY: compile clean

compile:
	compass compile

clean:
	compass clean

klarna:	compile
	cp stylesheets/klarna.css /home/malcolm/src/klarna/app/resources/public/css/klarna.css

crux:	compile
	cp stylesheets/crux.css /home/malcolm/src/crux/docs/styles/crux.css
