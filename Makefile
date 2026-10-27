# Aalto slides template — build helpers
# Requires: typst >= 0.15 (https://typst.app). Touying is fetched automatically.
# The Inter font ships in fonts/; --font-path makes builds reproducible.
# (Inter is also installed in ~/.local/share/fonts, so editor previews work too.)

TYPST ?= typst
ROOT  := --root .
FONTS := --font-path fonts

.PHONY: demo watch-demo new deck watch-deck cheatsheet clean help

## Build the demo deck → demo/demo.pdf
demo:
	$(TYPST) compile $(ROOT) $(FONTS) demo/main.typ demo/demo.pdf

## Rebuild the demo deck on every save
watch-demo:
	$(TYPST) watch $(ROOT) $(FONTS) demo/main.typ demo/demo.pdf

## Create a new deck: make new NAME=my-talk  → decks/my-talk/
new:
	@if [ -z "$(NAME)" ]; then echo "usage: make new NAME=my-talk"; exit 1; fi
	@if [ -e "decks/$(NAME)" ]; then echo "decks/$(NAME) already exists"; exit 1; fi
	@mkdir -p decks/$(NAME)/sections decks/$(NAME)/figures
	@cp template/main.typ decks/$(NAME)/main.typ
	@cp template/sections/01-main.typ decks/$(NAME)/sections/01-main.typ
	@cp template/OUTLINE.md decks/$(NAME)/OUTLINE.md
	@cp template/figures/README.md decks/$(NAME)/figures/README.md
	@echo "created decks/$(NAME)/ — fill decks/$(NAME)/OUTLINE.md first (docs/making-a-talk.md)"
	@echo "build:  make deck NAME=$(NAME)      watch:  make watch-deck NAME=$(NAME)"

## Build a deck: make deck NAME=my-talk → decks/my-talk/main.pdf
deck:
	@if [ -z "$(NAME)" ]; then echo "usage: make deck NAME=my-talk"; exit 1; fi
	$(TYPST) compile $(ROOT) $(FONTS) decks/$(NAME)/main.typ decks/$(NAME)/main.pdf

## Rebuild a deck on every save: make watch-deck NAME=my-talk
watch-deck:
	@if [ -z "$(NAME)" ]; then echo "usage: make watch-deck NAME=my-talk"; exit 1; fi
	$(TYPST) watch $(ROOT) $(FONTS) decks/$(NAME)/main.typ decks/$(NAME)/main.pdf

## Build the printable one-page cheat sheet → docs/cheatsheet.pdf
cheatsheet:
	$(TYPST) compile $(ROOT) $(FONTS) docs/cheatsheet.typ docs/cheatsheet.pdf

clean:
	rm -f demo/*.pdf decks/*/main.pdf

help:
	@echo "targets: demo | watch-demo | new NAME=... | deck NAME=... | watch-deck NAME=... | cheatsheet | clean"
