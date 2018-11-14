.PHONY: compile clean

compile:
	compass compile

clean:
	compass clean

klarna:	compile
	cp stylesheets/klarna.css /home/malcolm/src/klarna/app/resources/public/css/klarna.css
