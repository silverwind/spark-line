test:
	yarn -s run mocha test.js

publish:
	git push -u --tags origin master
	npm publish

deps:
	rm -rf node_modules
	yarn

update:
	yarn -s run updates -cu
	$(MAKE) deps

patch: test
	yarn -s run versions patch
	$(MAKE) publish

minor: test
	yarn -s run versions minor
	$(MAKE) publish

major: test
	yarn -s run versions major
	$(MAKE) publish

.PHONY: test publish deps update patch minor major
