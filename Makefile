.PHONY: compile clean

compile:
	compass compile

clean:
	compass clean

klarna:	compile
	cp stylesheets/klarna.css /home/malcolm/src/klarna/app/resources/public/css/klarna.css

stylesheets/juxt.css: stylesheets/foundation/*
	compass compile sass/juxt.css

juxt_css.jar: stylesheets/juxt.css
	mkdir -p target/juxt/asciidoctor/stylesheets/
	cp stylesheets/juxt.css target/juxt/asciidoctor/stylesheets/
	clojure -Sdeps '{:deps {pack/pack.alpha {:git/url "https://github.com/juxt/pack.alpha.git" :sha "3127f79578c565013c918231dbd1ba857aa02c8f"}}}' -m mach.pack.alpha.skinny --no-libs --project-path juxt_css.jar -e target
	rm -rf target

juxt_css_deploy: juxt_css.jar
	mvn deploy:deploy-file -Dfile=juxt_css.jar -DrepositoryId=clojars -Durl=https://clojars.org/repo -DpomFile=juxt.pom.xml
