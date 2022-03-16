.PHONY: all publish publish_no_init clean

all: publish

publish: publish.el
	@echo "Publishing with sweet Emacs configs preloaded 🎂"
	emacs --batch --load publish.el

publish_no_init: publish.el
	@echo "Publishing at high speed 🚄"
	emacs --batch --no-init --load publish.el

clean:
	@echo "Cleaning project 🧹🗑"
	@git reset --hard HEAD
