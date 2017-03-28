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
$$ make
```

bookmarklets
------------

endef

export README

generate: node_modules readme docs

node_modules:
	@npm install -g yarn
	@yarn

readme:
	@$(ECHO) "$$README"        > README.md
	@$(ECHO)                  >> README.md
	@$(ECHO) '```javascript'  >> README.md
	@$(ECHO) -n "javascript:" >> README.md
	@$(COMPILE)               >> README.md
	@$(ECHO)                  >> README.md
	@$(ECHO) '```'            >> README.md
	@$(ECHO)                  >> README.md

docs:
	@$(PUG) src/*.pug -o docs -O '{ title: "$(TITLE)", code: "'$$( $(COMPILE) | $(ESCAPE) )'" }'

.PHONY: generate docs readme
