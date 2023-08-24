#!/bin/bash

# Convert Markdown files to EPUB
pandoc \
  -S \
  -o output/my-ebook.epub \
  cover.md        \
  introduction.md \
  main.md         \
  chapters/*.md   \
  conclusion.md

# Convert EPUB to PDF (optional)
ebook-convert output/my-ebook.epub output/my-ebook.pdf

echo "Ebook generation completed!"
