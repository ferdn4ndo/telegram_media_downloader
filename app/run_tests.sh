#!/bin/sh

TEST_ARTIFACTS_FOLDER="${TEST_ARTIFACTS_FOLDER:-/home/worker/app/coverage}"

echo "Running PyLint on source files..."

pylint media_downloader.py utils -r y

echo "Performing static type check..."

mypy media_downloader.py utils --ignore-missing-imports

echo "Running UTs for telegram_media_downloader..."

py.test --cov media_downloader --doctest-modules \
		--cov utils \
		--cov-report term-missing \
		--cov-report html:${TEST_ARTIFACTS_FOLDER} \
		--junit-xml=${TEST_ARTIFACTS_FOLDER}/media-downloader.xml \
		tests/

echo "Finished executing tests!"
