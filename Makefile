TITLE = go-gh-pages
ECHO = /bin/echo
BABEL = node_modules/.bin/babel
UGLIFY = node_modules/.bin/uglifyjs
PUG = node_modules/.bin/pug
TARGET = src/index.js
ESCAPE = bin/escape
COMPILE = $(BABEL) $(TARGET) | $(UGLIFY)

define README
$(TITLE)
====================

generate bookmarklet
--------------------

```sh
$$ npm install -g yarn
$$ yarn
$$ make
```

bookmarklets
------------

endef

export README

generate: readme docs

readme:
	@$(ECHO) "$$README"        > README.md
	@$(ECHO) ""               >> README.md
	@$(ECHO) '```javascript'  >> README.md
	@$(ECHO) -n "javascript:" >> README.md
	@$(COMPILE)               >> README.md
	@$(ECHO) ""               >> README.md
	@$(ECHO) '```'            >> README.md
	@$(ECHO) ""               >> README.md

docs:
	@$(PUG) src/*.pug -o docs -O '{ title: "$(TITLE)", code: "'$$( $(COMPILE) | $(ESCAPE) )'" }'

.PHONY: all generate yarn docs
